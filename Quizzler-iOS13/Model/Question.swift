//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Harvinder Sethi on 10/4/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let title : String
    let options : [String]
    let answer : String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.title = q
        self.options = a
        self.answer = correctAnswer
    }
}
