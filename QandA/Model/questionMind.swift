//
//  questionMind.swift
//  QandA
//
//  Created by Anurag Chourasia on 06/03/23.
//

import Foundation
struct QuestionMind{
    
    var questionNumber = 0
    var score = 0
    
    let quiz = [
        questions(q: "A slug's blood is green.", a: "Right!"),
        questions(q: "Approximately one quarter of human bones are in the feet.", a: "Right!"),
        questions(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "Right!"),
        questions(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "Right!"),
        questions(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "Wrong!"),
        questions(q: "It is illegal to pee in the Ocean in Portugal.", a: "Right!"),
        questions(q: "You can lead a cow down stairs but not up stairs.", a: "Wrong!"),
        questions(q: "Google was originally called 'Backrub'.", a: "Right!"),
        questions(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "Right!"),
        questions(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "Wrong!"),
        questions(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "Wrong!"),
        questions(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "Right!")
    ]
    
    func getQuestionText() -> String {
        return quiz[questionNumber].que
    }
    
    func getProgress() -> Float {
        return Float(questionNumber) / Float(quiz.count)
    }
    
    mutating func getScore() -> Int {
        return score
    }
    
     mutating func nextQuestion() {
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
    
    mutating func checkAnswer(userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].ans {
            score += 1
            return true
        } else {
            return false
        }
    }
}
