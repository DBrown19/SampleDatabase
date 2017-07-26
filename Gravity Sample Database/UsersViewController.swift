//
//  UsersViewController.swift
//  Gravity Sample Database
//
//  Created by David Brown on 7/26/17.
//  Copyright © 2017 David Brown. All rights reserved.
//

import UIKit
import Alamofire
import Gloss
import FirebaseDatabase
import Firebase

class UsersViewController: UIViewController {

    @IBOutlet weak var userTable: UITableView!
    
    var senators: [Senator] = []
    var myIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request("https://mygov-ecfe0.firebaseio.com/senators.json").responseJSON(completionHandler: {
            response in
            
            if let senatorsDictionary = response.result.value as? JSON {
                
                for (key, value) in senatorsDictionary {
                    
                    if let senatorDictionary = value as? JSON {
                        var senator = Senator(json: senatorDictionary)
                        senator?.key = key
                        self.senators.append(senator!)
                        self.userTable.reloadData()
                    }
                    
                }
                
            }
            
        })
               
    }

    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return senators.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userTable.dequeueReusableCell(withIdentifier: "senatorCell", for: indexPath)
        
        // Configure the cell...
        let name1 = senators[indexPath.row].firstName
        let namespace = " "
        let name2 = senators[indexPath.row].lastName
        
        var fullName = name1! + namespace + name2!
        
        // Trying to use this to indicate party by manipulating string
        if senators[indexPath.row].senateParty == "republican" {
            fullName = name1! + namespace + name2! + " (R)"
        } else {
            fullName = name1! + namespace + name2! + " (D)"
        }
        
        print(fullName)
        print("2test")

        
        cell.textLabel?.text = fullName
        cell.detailTextLabel?.text = senators[indexPath.row].stateName
        
        return cell
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        
        print("this works")
        
        let cell = tableView.cellForRow(at: indexPath)
        
        performSegue(withIdentifier: "segue1", sender: cell)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
