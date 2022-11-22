//
//  Question.swift
//  DinerPoll
//
//  Created by Max Franz Immelmann on 11/21/22.
//

import Foundation

class Question {
    let title: String
    let answers: [Diner]
    
    init(title: String, answers: [Diner]) {
        self.title = title
        self.answers = answers
    }
}

extension Question {
    static func getQuestion(for diners: [Diner]) -> Question {
        return Question(
            title: "What diner do you prefer?",
            answers: diners
        )
    }
}
