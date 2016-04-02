//
//  Rating.swift
//  InstantRating
//
//  Created by Aaron Eliason on 3/30/16.
//  Copyright © 2016 IlasonApps. All rights reserved.
//

import Foundation

class Rating {
    private let kRatingID = "rating"
    private let kUserID = "userID"
    private let kComment = "comment"
    
    var ratingID: Int
    var userID: String
    var comment: String
    
    var jsonValue: [String: AnyObject] {
        return [kRatingID: ratingID, kUserID: userID, kComment: comment]
    }
    
    init?(json: [String: AnyObject], identifier: String) {
        guard let ratingID = json[kRatingID] as? Int,
                let userID = json[kUserID] as? String,
                let comment = json[kComment] as? String else {return nil}
        self.ratingID = ratingID
        self.userID = userID
        self.comment = comment
        
        
    }
    
    init(ratingID: Int, userID: String, comment: String) {
        self.ratingID = ratingID
        self.userID = userID
        self.comment = comment
    }
}