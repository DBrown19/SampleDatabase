//
//  User.swift
//  Gravity Sample Database
//
//  Created by David Brown on 7/27/17.
//  Copyright © 2017 David Brown. All rights reserved.
//


import Foundation
import Gloss

class User: Glossy, Decodable {
    
    var userKey: String?
    var userAge: Int?
    var userEmail: String?
    var userEngagement: Int?
    var userFirstName: String?
    var userHonesty: Int?
    var userIncome: Int?
    var userKnowledge: Int?
    var userLastName: String?
    var userOccupation: String?
    var userPicture: String?
    var userRace: String?
    var userTestName: String?
    var userTotal: Int?
    var userTestType: String?
    
    init?() {
        self.userKey = ""
        self.userFirstName = ""
        self.userLastName = ""
        self.userOccupation = ""
        
    }
    
    required init?(json: JSON) {
        
        var userKey: String?
        var userAge: Int?
        var userEmail: String?
        var userEngagement: Int?
        var userFirstName: String?
        var userHonesty: Int?
        var userIncome: Int?
        var userKnowledge: Int?
        var userLastName: String?
        var userOccupation: String?
        var userPicture: String?
        var userRace: String?
        var userTestName: String?
        var userTotal: Int?
        var userTestType: String?
        
        self.userAge = "age" <~~ json
        self.userEmail = "email" <~~ json
        self.userEngagement = "engagement" <~~ json
        self.userFirstName = "first_name" <~~ json
        self.userHonesty = "honest" <~~ json
        self.userIncome = "income" <~~ json
        self.userKnowledge = "knowledge" <~~ json
        self.userLastName = "last_name" <~~ json
        self.userOccupation = "occupation" <~~ json
        self.userPicture = "photo" <~~ json
        self.userRace = "race" <~~ json
        self.userTestName = "test" <~~ json
        self.userTotal = "total" <~~ json
        self.userTestType = "type_of_test" <~~ json
        
          }
    
    
    func toJSON() -> JSON? {
        return jsonify([
           // "state_name" ~~> self.stateName,
           // "state_code" ~~> self.stateCode
            ])
    }
    
}
