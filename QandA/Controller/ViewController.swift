//
//  ViewController.swift
//  QandA
//
//  Created by Anurag Chourasia on 06/03/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var wrongAnswerButton: UIButton!
    @IBOutlet var rightAnswerButton: UIButton!
    @IBOutlet var progressBarView: UIProgressView!
    
    var questionMind = QuestionMind()
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = questionMind.checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        questionMind.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        
        wrongAnswerButton.layer.borderWidth = 2
        wrongAnswerButton.layer.cornerRadius = 10
        wrongAnswerButton.layer.borderColor = UIColor.gray.cgColor
        
        rightAnswerButton.layer.borderWidth = 2
        rightAnswerButton.layer.cornerRadius = 10
        rightAnswerButton.layer.borderColor = UIColor.gray.cgColor
        
        questionLabel.text = questionMind.getQuestionText()
        progressBarView.progress = questionMind.getProgress()
        scoreLabel.text = "Score: \(questionMind.getScore())"
        
        rightAnswerButton.backgroundColor = UIColor.clear
        wrongAnswerButton.backgroundColor = UIColor.clear
    }

}

