//
//  User2TableViewController.swift
//  Gravity Sample Database
//
//  Created by David Brown on 7/27/17.
//  Copyright © 2017 David Brown. All rights reserved.
//


import UIKit
import Alamofire
import Gloss

class SenateTableViewController: UITableViewController {
    
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
                        self.tableView.reloadData()
                    }
                    
                }
                
            }
            
        })
        
        print("123test")
        print([Senator]())
        print(senators)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segue1" {
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: cell)
            let selectedSenator = senators[(indexPath?.row)!]
            
            let infoVC = segue.destination as! InfoViewController
            infoVC.senator = selectedSenator
        }
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return senators.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "senatorCell", for: indexPath)
        
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
        
        cell.textLabel?.text = fullName
        cell.detailTextLabel?.text = senators[indexPath.row].stateName
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        
        print("this works")
        
        let cell = tableView.cellForRow(at: indexPath)
        
        performSegue(withIdentifier: "segue1", sender: cell)
        
    }
    
}
