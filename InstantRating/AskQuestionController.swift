//
//  AskQuestionController.swift
//  InstantRating
//
//  Created by Aaron Eliason on 4/4/16.
//  Copyright © 2016 IlasonApps. All rights reserved.
//

import Foundation
import Firebase

let base = Firebase(url: "instant-rating.firebaseIO.com")

let questionEnpoint = "Questions"

class AskQuestionController {
    
    var questions: [Questions] = []
    
    static let sharedInstance = AskQuestionController()
    
    func loadAllQuestions(completion:(success: Bool) -> Void) {
        let questionRef = FirebaseController.base.childByAppendingPath("Questions")
        questionRef.observeEventType(.Value, withBlock: { snapshot in
            guard let data = snapshot.value as? [String: AnyObject] else {return}
            
            self.questions = [Questions]()
            for (key, value) in data {
                if let json = value as? [String: AnyObject] {
                    if let question = Questions(json: json, identifier: key) {
                        self.questions.append(question)
                    }
                }
            }
            completion(success: true)
        })
    }
    
    static func createQuestion(question: String, rating: Int, text: String) {
        var question = Questions(questionID: question, ratingID: rating, text: text)
    }
    
}
