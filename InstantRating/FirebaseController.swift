//
//  FirebaseController.swift
//  InstantRating
//
//  Created by Aaron Eliason on 3/30/16.
//  Copyright © 2016 IlasonApps. All rights reserved.
//

import Foundation
import Firebase



class FirebaseController {
    static let base = Firebase(url: "https://instant-rating.firebaseio.com/")
    
    // TODO: - Create DataAtEndpoint func
    
}
protocol FirebaseType {
    var identifier: String? {get set}
    var endpoint: String {get}
    var jsonValue: [String: AnyObject] {get}
    mutating func save()
    func delete()
}




extension FirebaseType {
    mutating func save() {
        var newEndpoint: Firebase
        if let identifier = identifier {
            newEndpoint = FirebaseController.base.childByAppendingPath(endpoint).childByAppendingPath(identifier)
        } else {
            newEndpoint = FirebaseController.base.childByAppendingPath(endpoint).childByAutoId()
            self.identifier = newEndpoint.key
        }
        newEndpoint.updateChildValues(jsonValue)
    }
    
    func delete() {
        if let identifier = identifier {
            FirebaseController.base.childByAppendingPath(endpoint).childByAppendingPath(identifier).removeValue()
        }
    }
}