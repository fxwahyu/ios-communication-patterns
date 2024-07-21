//
//  ChooseDurationViewController.swift
//  Communication Patterns Example
//
//  Created by Wahyu Herdianto on 18/07/24.
//

import UIKit

protocol ChooseDurationDelegate {
    func durationChosen(duration: Int)
}

class ChooseDurationViewController: UIViewController {
    
    var delegate: ChooseDurationDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func optionA(_ sender: Any) {
        delegate?.durationChosen(duration: 10)
        self.dismiss(animated: true)
    }
    
    @IBAction func optionB(_ sender: Any) {
        delegate?.durationChosen(duration: 20)
        self.dismiss(animated: true)
    }
    
    @IBAction func optionC(_ sender: Any) {
        delegate?.durationChosen(duration: 30)
        self.dismiss(animated: true)
    }
    
    @IBAction func optionD(_ sender: Any) {
        delegate?.durationChosen(duration: 60)
        self.dismiss(animated: true)
    }
}
