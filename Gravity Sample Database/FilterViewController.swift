//
//  FilterViewController.swift
//  Gravity Sample Database
//
//  Created by David Brown on 7/27/17.
//  Copyright © 2017 David Brown. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {

    var maleButton = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func maleFilter(_ sender: Any) {
        if maleButton == 1 {
            maleButton = 0
        } else {
            
            maleButton = 1
        }
    }
    
    
    @IBAction func segueButton(_ sender: Any) {
            performSegue(withIdentifier: "filterToTable", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        
        let tableVC = segue.destination as! UserTableViewController
        
        tableVC.maleFilter = maleButton
        
    }
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segue1" {
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: cell)
            let selectedUser = users[(indexPath?.row)!]
            
            let infoVC = segue.destination as! UserInfoViewController
            infoVC.user = selectedUser
        }
        
    }

 */
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
