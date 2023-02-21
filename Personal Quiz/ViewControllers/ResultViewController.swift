//
//  ResultViewController.swift
//  Personal Quiz
//
//  Created by Ярослав Любиченко on 20.2.2023.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    
    var answer: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculateResult()
    }
    
    func calculateResult() {
        let mostFrequencyAnswers = answer.reduce(into: [Animal: Int]()) {
            (counts, answer) in counts[answer.animal, default: 0] += 1
        }
        
        let commonAnswer = mostFrequencyAnswers.sorted { $0.1 > $1.1 }.first!.key
        
        resultAnswerLabel.text = "Вы - \(commonAnswer.rawValue)"
        resultDefinitionLabel.text = commonAnswer.definition
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
