//
//  Extension.swift
//  Communication Patterns Example
//
//  Created by Wahyu Herdianto on 19/07/24.
//

import Foundation

public func setTimerString(number: Int) -> String {
    return "00 : \(number >= 10 ? number.description : "0\(number)")"
}
