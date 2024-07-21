//
//  BillingTimer.swift
//  Communication Patterns Example
//
//  Created by Wahyu Herdianto on 19/07/24.
//

import Foundation

final class BillingTimer {
    var timer = Timer()
    var duration: Int = 0 {
        didSet {
            sendNotification()
        }
    }
    
    func startTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCountdown), userInfo: nil, repeats: true)
    }
    
    @objc private func timerCountdown() {
        self.duration -= 1
    }
    
    private func sendNotification() {
        NotificationCenter.default.post(name: NSNotification.Name(NotificationName.Name.TIMER.rawValue), object: nil, userInfo: ["timer":self.duration])
        if self.duration == 0 {
            NotificationCenter.default.post(name: NSNotification.Name(NotificationName.Name.TIME_IS_UP.rawValue), object: nil)
            self.timer.invalidate()
        }
    }
}
