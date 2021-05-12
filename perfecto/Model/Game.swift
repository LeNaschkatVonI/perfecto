//
//  Game.swift
//  perfecto
//
//  Created by Максим Нуждин on 16.04.2021.
//

import SwiftUI

struct Game {
    
    var target: Int = Int.random(in: 1...100)
    var score: Int = 0
    var round: Int = 1
    var closeToPerfect: Int = 0
    var percentage: Double = 0
    
    mutating func points(sliderValue: Int) -> Double {
        
        closeToPerfect = 100 - abs(target - sliderValue)
 
        score += closeToPerfect
        
        percentage = Double(score) / Double(round)
        
        round += 1
        
        return percentage
    }
}
