//
//  Questions.swift
//  InstantRating
//
//  Created by Aaron Eliason on 4/1/16.
//  Copyright © 2016 IlasonApps. All rights reserved.
//

import Foundation
import Firebase

class Questions {
    private let kQuestionID = "questionID"
    private let kRatingIDs = "ratingIDs"
    private let kText = "text"
    
    var questionID: String
    var ratingID: [Int]
    var text: String
    
    var jsonValue: [String: AnyObject] {
        return [kQuestionID: questionID, kRatingIDs: ratingID, kText: text]
    }
    
    init?(json: [String: AnyObject], identifier: String) {
        guard let questionID = json[kQuestionID] as? String,
                let ratingID = json[kRatingIDs] as? Int,
                let text = json[kText] as? String else {return nil}
        self.questionID = questionID
        self.ratingID = [ratingID]
        self.text = text
    }
    
    init(questionID: String, ratingID: Int, text: String) {
        self.questionID = questionID
        self.ratingID = [ratingID]
        self.text = text
    }
}