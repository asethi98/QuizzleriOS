//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Avneet Sethi on 10/4/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

/*
 Note: You cannot modify the fields/properties of a struct inside a struct. They're
 considered immutable. You can do it outside a struct.
 
 Inside a struct, when "self" is created automatically in the background, it's defined
 with the let keyword, which is why it is immutable.
 
 If you need to change a property inside a struct, you have to mark the method with a
 special keyword: mutating
 */

struct QuizBrain {
    
    let quiz: [Question] = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    var questionNumber = 0
    
    var score = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        var isAnswerCorrect = false
        if (userAnswer == quiz[questionNumber].answer) {
            isAnswerCorrect = true
            score += 1
        }
        return isAnswerCorrect
    }
    
    mutating func goToNextQuestion() {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
            score = 0
        }
    }
    
    func getQuestionTitle() -> String {
        return quiz[questionNumber].title
    }
    
    func getAnswerChoice(answerChoice: Int) -> String {
        return quiz[questionNumber].options[answerChoice - 1]
    }
    
    func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(quiz.count)
    }
    
    func getScore() -> Int {
        return score
    }
}
