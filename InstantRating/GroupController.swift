//
//  GroupController.swift
//  InstantRating
//
//  Created by Aaron Eliason on 4/4/16.
//  Copyright © 2016 IlasonApps. All rights reserved.
//

import Foundation

class GroupController {
    
    static let sharedInstance = GroupController()
    
    var myGroups = [Groups]()
    
    // TODO: - Create method that pulls a users hosted groups
    
    // TODO: - Make a method that creates a group in firebase
    
    // TODO: - Make a method that pulls groups that a user is a part of
    static func fetchUserGroupsCreated(hostUserID: String, completion:([Groups] -> Void)) {
        let groupRef = FirebaseController.base.childByAppendingPath("groups")
        groupRef.observeSingleEventOfType(.Value, withBlock: { (snapshot) in
            guard let data = snapshot.value as? [String: AnyObject] else {return}
                self.sharedInstance.myGroups = [Groups]()
            for (key, value) in data {
                if let json = value as? [String: AnyObject] {
                    if let group = Groups(json: json, identifier: key) {
                        self.sharedInstance.myGroups.append(group)
                    }
                }
            }
            completion([Groups])
            
            // Convert into Group objects using Group(init)
            
            // completion: array of group objects
        })
    }
    
    // TODO: - Make a method that fetches a group with an identifier
    
    // TODO: - Make a method that adds a user to a group
    
}


//func loadAllQuestions(completion:(success: Bool) -> Void) {
//    let questionRef = FirebaseController.base.childByAppendingPath("Questions")
//    questionRef.observeEventType(.Value, withBlock: { snapshot in
//        guard let data = snapshot.value as? [String: AnyObject] else {return}
//        
//        self.questions = [Questions]()
//        for (key, value) in data {
//            if let json = value as? [String: AnyObject] {
//                if let question = Questions(json: json, identifier: key) {
//                    self.questions.append(question)
//                }
//            }
//        }
//        completion(success: true)
//    })
//}