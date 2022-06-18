//
//  ViewController.swift
//  Quiz App
//
//  Created by Jay Prakash Sharma on 30/05/22.
//

import UIKit

class SecondViewController: UIViewController {
    //variables
    var questionCount = 0
    var score = 0
    // Text View for questions
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textView: UITextView!
    //Options Button
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var playQuiz: UIButton!
    @IBOutlet var nextButton: UIView!
    // Set of Questions and answers
    var setOfQuestions:[[String:Any]] = [
        [
            "question" : "Capital of India ?",
            "option" : ["Delhi", "Punjab", "Lucknow", "Haryana"],
            "answer": "Delhi"
        ],
        [
            "question" : "Language spoken in Chennai ?",
            "option" : ["Tamil", "Hindi", "English", "Urdu"],
            "answer": "Tamil"
        ],
        [
            "question" : "Who is current Prime Minister of America ?",
            "option" : ["Donald Trump", "Johnson", "Joe Biden", "Modi"],
            "answer": "Joe Biden"
        ],
        [
            "question" : "Current in Canada ?",
            "option" : ["Rupee", "Pound", "US Dollar", "Canadian Dollar"],
            "answer": "Canadian Dollar"
        ],
        [
            "question" : "National game of India ?",
            "option" : ["Cricket", "Hockey", "Football", "Kabaddi"],
            "answer": "Hockey"
        ],
        
    ]
    // Data loading after play button from first screen
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textView.text = "1. All questions are multiple type. \n2. You cannot go back after submiting answer. \n3. Score will be calculated per correct answer."
        option1.isHidden = true
        option2.isHidden = true
        option3.isHidden = true
        option4.isHidden = true
        scoreLabel.isHidden = true
        nextButton.isHidden = true
    }
    // Play Quiz button
    @IBAction func playQuiz(_ sender: UIButton) {
        if sender.tag == 4 && questionCount < setOfQuestions.count{
            // Options Shown
            option1.isHidden = false
            option2.isHidden = false
            option3.isHidden = false
            option4.isHidden = false
            scoreLabel.isHidden = false
            scoreLabel.text = ""
            // Play quiz button hidden
            playQuiz.isHidden = true
            // Label updated after play quiz button
            label.text = "Your question"
            // Next button hidden
            nextButton.isHidden = true
        }
        // Fetching Questions and options
        // first row data fetching because questionCount = 0
        let firstData = setOfQuestions[questionCount]
        // questions
        let question = firstData["question"] as? String
        textView.text = question
        // options
        let optionOfQuestion = firstData["option"] as? Array<Any>
        option1.setTitle(optionOfQuestion?[0] as? String, for: .normal)
        option2.setTitle(optionOfQuestion?[1] as? String, for: .normal)
        option3.setTitle(optionOfQuestion?[2] as? String, for: .normal)
        option4.setTitle(optionOfQuestion?[3] as? String, for: .normal)
    }
    //Checking correct answer
    @IBAction func checkAnswer(_ sender: UIButton) {
        let data = setOfQuestions[questionCount]
        let correctAns = data["answer"] as? String
        if let options = data["option"] as? [String] {
            if correctAns == options[sender.tag]{
                scoreLabel.text = "Correct"
                score += 1
            } else if correctAns != options[sender.tag] {
                scoreLabel.text = "Wrong"
            }
        }
        //loading next row question and options because questionCount is incremented by 1
        questionCount += 1
        if questionCount < setOfQuestions.count{
            let nextData = setOfQuestions[questionCount]
            // questions
            let question = nextData["question"] as? String
            textView.text = question
            // options
            let optionOfQuestion = nextData["option"] as? Array<Any>
            option1.setTitle(optionOfQuestion?[0] as? String, for: .normal)
            option2.setTitle(optionOfQuestion?[1] as? String, for: .normal)
            option3.setTitle(optionOfQuestion?[2] as? String, for: .normal)
            option4.setTitle(optionOfQuestion?[3] as? String, for: .normal)
            score = score + 0
        }
        // Navigating to third screen when count of questionCount and setOfQuestion are equal
        else if questionCount == setOfQuestions.count{
            if let thirdVC = self.storyboard?.instantiateViewController(identifier: "ThirdViewController") as? ThirdViewController {
                thirdVC.result = "Total Score: \n \(String(score)) out of \(String(setOfQuestions.count))"
                self.navigationController?.pushViewController(thirdVC, animated: true)
            }
        }
    }
}

