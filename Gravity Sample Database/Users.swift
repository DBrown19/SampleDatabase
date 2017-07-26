//
//  Users.swift
//  Gravity Sample Database
//
//  Created by David Brown on 7/26/17.
//  Copyright © 2017 David Brown. All rights reserved.
//


import Foundation
import Gloss

class Senator: Glossy, Decodable {
    
    var key: String?
    var stateName: String?
    var stateCode: String?
    var firstName: String?
    var lastName: String?
    var senateParty: String?
    var senateBio: String?
    var senateContact: String?
    var senatePicture: String?
    var senateEmail: String?
    var senateFacebook: String?
    var senateTwitter: String?
    var senateWebsite: String?
    
    init?() {
        self.key = ""
        self.stateName = ""
        self.stateCode = ""
        
    }
    
    required init?(json: JSON) {
        self.stateName = "state_name" <~~ json
        self.stateCode = "state_code" <~~ json
        self.firstName = "first_name" <~~ json
        self.lastName  = "last_name" <~~ json
        self.senateParty = "party" <~~ json
        self.senateBio = "biography" <~~ json
        self.senatePicture = "photo_url" <~~ json
        self.senateEmail = "email" <~~ json
        self.senateFacebook = "facebook_url" <~~ json
        self.senateTwitter = "twitter_url" <~~ json
        self.senateWebsite = "website" <~~ json
        self.senateContact = "contact_page" <~~ json
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "state_name" ~~> self.stateName,
            "state_code" ~~> self.stateCode
            ])
    }
    
}
