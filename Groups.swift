//
//  Groups.swift
//  InstantRating
//
//  Created by Aaron Eliason on 3/30/16.
//  Copyright © 2016 IlasonApps. All rights reserved.
//

import Foundation

class Groups {
    private let kGroupName = "groupName"
    private let kQuestionID = "questionID"
    private let khostUserID = "hostUserID"
    private let kUserIDs = "userIDs"
    
    
    var groupName: String
    var userIDs: [String]
    var questionID: String
    var hostUserID: String
    var identifier: String?
    var endpoint: String
    
    var jsonValue: [String: AnyObject] {
        return [kGroupName: groupName, kQuestionID: questionID, khostUserID : hostUserID, kUserIDs: userIDs]

    }
    
    init?(json: [String: AnyObject], identifier: String) {
        guard let groupNameID = json[kGroupName] as? String,
                let userIDs = json[kUserIDs] as? String,
                let questionID = json[kQuestionID] as? String,
                let hostUserID = json[khostUserID] as? String else {return nil}

        
        self.groupName = groupNameID
        self.questionID = questionID
        self.hostUserID = hostUserID
        self.userIDs = [userIDs]
    }
    
    
    
    init(groupName: String, questionID: String, hostUserID: String, userIDs: [String]) {
        self.groupName = groupName
        self.questionID = questionID
        self.hostUserID = hostUserID
        self.userIDs = userIDs
        
    }
    
}
