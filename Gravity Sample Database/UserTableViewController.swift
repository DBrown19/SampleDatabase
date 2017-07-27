//
//  UserTableViewController.swift
//  Gravity Sample Database
//
//  Created by David Brown on 7/26/17.
//  Copyright © 2017 David Brown. All rights reserved.
//



import UIKit
import Alamofire
import Gloss

class UserTableViewController: UITableViewController {
    
    var user: User?
    var users: [User] = []
    var myIndex = 0
    var maleFilter: Int?
   // let cell = UITableViewCell()
 //   let indexPath = tableView.indexPath
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("https://gravity-sample-database.firebaseio.com/users.json").responseJSON(completionHandler: {
            response in
            
            if let usersDictionary = response.result.value as? JSON {
                
                for (key, value) in usersDictionary {
                    
                    if let usersDictionary = value as? JSON {
                        var user = User(json: usersDictionary)
                        user?.userKey = key
                        self.users.append(user!)
                        self.tableView.reloadData()
                    }
                }
            }
        })
    }
        
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        /*
        ///THIS PART
        if maleFilter == 1 {
            
            self.tableView.reloadData()
            if user?.userGender == "Male" {
                self.users.append(user!)
                self.tableView.reloadData()
            } else {
                users.remove(at: indexPath)
               // users.removeAtIndex(deletionIndexPath.row)
                tableView.deleteRows(at: users[(indexPath?.row)!], with: UITableViewRowAnimation)
                print("not male")
            }
        } else {
            print("Male filter not applied")
        }
 */
        
        print(maleFilter)
        if maleFilter == 1 {
            self.tableView.reloadData()
            if user?.userGender == "Male" {
                print ("male")
              //  self.users.append(user!)
               // self.tableView.reloadData()
            } else {
                /*
                 users.remove(at: indexPath)
                 // users.removeAtIndex(deletionIndexPath.row)
                 tableView.deleteRows(at: [indexPath.row], with: UITableViewRowAnimation)
                 print("not male")
                 */
               
                /// code gets to this point
                print("checkpoint")

          //    let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (rowAction: UITableViewRowAction, indexPath: IndexPath) -> Void in
                func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {

                    
                    ///code is not getting to here
                    print("Deleted")

                    self.tableView.deleteRows(at: [indexPath], with: .automatic)
                    self.tableView.reloadData()
                }
            }
        } else {
            print("Male filter not applied")
        }
        self.tableView.reloadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "userTableToInfo" {
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: cell)
            let selectedUser = users[(indexPath?.row)!]
            let infoVC = segue.destination as! UserInfoViewController
            infoVC.user = selectedUser
        }
    

    }
 
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        
        // Configure the cell...
        let name1 = users[indexPath.row].userFirstName
        let namespace = " "
        let name2 = users[indexPath.row].userLastName
        
    
        
        var fullName = name1! + namespace + name2!
        //    print(fullName)


     /*
        // Trying to use this to indicate party by manipulating string
        if users[indexPath.row].senateParty == "republican" {
            fullName = name1! + namespace + name2! + " (R)"
        } else {
            fullName = name1! + namespace + name2! + " (D)"
        }
        */
        
        
        cell.textLabel?.text = fullName
        cell.detailTextLabel?.text = users[indexPath.row].userOccupation
        
        return cell
        

        
    }
 
    
    

    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        
        print("this works")
        
        let cell = tableView.cellForRow(at: indexPath)
        
        performSegue(withIdentifier: "userTableToInfo", sender: cell)
        
    }
    
}
