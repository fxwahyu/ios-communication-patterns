//
//  MainViewController.swift
//  Communication Patterns Example
//
//  Created by Wahyu Herdianto on 18/07/24.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var chooseDurationButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var page1Button: UIButton!
    @IBOutlet weak var page2Button: UIButton!
    
    var billing = BillingTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showButtons(startBtn: false, button1: false, button2: false, choose: true)
        NotificationCenter.default.addObserver(self, selector: #selector(openAnimation), name: NSNotification.Name(NotificationName.Name.TIME_IS_UP.rawValue), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateTimer(_:)), name: NSNotification.Name(NotificationName.Name.TIMER.rawValue), object: nil)
    }
    
    @IBAction func chooseDuration(_ sender: Any) {
        let vc = ChooseDurationViewController()
        vc.delegate = self
        self.present(vc, animated: true)
    }
    
    @IBAction func startBilling(_ sender: Any) {
        billing.startTimer()
        showButtons(startBtn: false, button1: true, button2: true, choose: false)
    }
    
    @objc func updateTimer(_ notification: Notification) {
        let duration = notification.userInfo?["timer"] as? Int ?? 0
        self.durationLabel.text = setTimerString(number: duration)
        if duration == 0 {
            showButtons(startBtn: false, button1: false, button2: false, choose: true)
        }
    }
    
    @objc func openAnimation() {
        let vc = AnimationPage()
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: false, completion: nil)
    }
    
    @IBAction func openGame1(_ sender: Any) {
        navigationController?.pushViewController(GameViewController(), animated: false)
    }
    
    @IBAction func openGame2(_ sender: Any) {
        navigationController?.pushViewController(BrowserViewController(), animated: false)
    }
    
    private func showButtons(startBtn: Bool, button1: Bool, button2: Bool, choose: Bool) {
        startButton.isHidden = !startBtn
        page1Button.isHidden = !button1
        page2Button.isHidden = !button2
        chooseDurationButton.isHidden = !choose
    }
}

extension MainViewController: ChooseDurationDelegate {
    func durationChosen(duration: Int) {
        billing.duration = duration
        showButtons(startBtn: true, button1: false, button2: false, choose: true)
    }
}


