//
//  InfoViewController.swift
//  Gravity Sample Database
//
//  Created by David Brown on 7/27/17.
//  Copyright © 2017 David Brown. All rights reserved.
//

import UIKit
import Alamofire
import Gloss
import AlamofireImage

class UserInfoViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    var user: User?
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("https://gravity-sample-database.firebaseio.com/users.json").responseJSON(completionHandler: {
            response in
            
            if let usersDictionary = response.result.value as? JSON {
                
                for (key, value) in usersDictionary {
                    
                    if let usersDictionary = value as? JSON {
                        var user = User(json: usersDictionary)
                        user?.userKey = key
                       
                    }
                    
                }
                
            }
            
        })
        
        let fullName = (user?.userFirstName)! + " " + (user?.userLastName)!
        
        nameLabel.text = fullName
    }
    
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
