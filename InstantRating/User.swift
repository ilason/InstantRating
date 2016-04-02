//
//  User.swift
//  InstantRating
//
//  Created by Aaron Eliason on 3/30/16.
//  Copyright © 2016 IlasonApps. All rights reserved.
//

import Foundation

class User {
    private let kUsername = "username"
    private let kUserID = "userID"
    
    var username = ""
    var identifier: String?
    var endpoint: String {
        return "users"
    }
    var jsonValue: [String: AnyObject] {
        var json: [String: AnyObject] = [kUsername: username]
        
        if let identifier = identifier {
            json.updateValue(kUsername, forKey: identifier)
        }
        return json
    }
    init? (json: [String: AnyObject], identifier: String) {
        
        guard let username = json[kUsername] as? String else {return nil}
        
        self.username = username
        self.identifier = identifier
    }
    
    init(username: String, uid: String) {
        self.username = username
        self.identifier = uid
    }
}
