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
    
    var users: [User] = []
    var myIndex = 0
    var maleFilter: Int?
    
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
    
        
        if maleFilter == 1 {
            print("enabled")
        } else {
            print("not enabled")
        }
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
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
        
    
        
        // var fullName = name1! + namespace + name2!
        //    print(fullName)


     /*
        // Trying to use this to indicate party by manipulating string
        if users[indexPath.row].senateParty == "republican" {
            fullName = name1! + namespace + name2! + " (R)"
        } else {
            fullName = name1! + namespace + name2! + " (D)"
        }
        */
       // print(fullName)
        
      //  cell.textLabel?.text = fullName
        cell.textLabel?.text = users[indexPath.row].userFirstName
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
