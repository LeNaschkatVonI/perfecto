//
//  Game.swift
//  perfecto
//
//  Created by Максим Нуждин on 16.04.2021.
//

import SwiftUI

struct leaderBoardEntry {
    var percentage: Int
    var date: Date
}

struct Game {
    
    var target: Int = Int.random(in: 1...100)
    var score: Int = 0
    var round: Int = 1
    var closeToPerfect: Int = 0
    var percentage: Double = 0
    var bonusPoints: Int = 0
    var leaderBoardEntries: [leaderBoardEntry] = []
    
    mutating func points(sliderValue: Int) -> Int {
        closeToPerfect = 100 - abs(target - sliderValue)
        score += closeToPerfect
        return closeToPerfect
    }
    
    mutating func startNewRound() {
        round += 1
        target = Int.random(in: 1...100)
        bonusPoints = 0
        leaderBoardEntries.append(leaderBoardEntry(percentage: Int(percentage), date: Date()))
        leaderBoardEntries.sort { $0.percentage > $1.percentage }
    }
    
    mutating func updatePercentage() {
        percentage = Double(score) / Double(round)
    }
    
    mutating func bonus() {
        if closeToPerfect == 100 {
            bonusPoints = 100
        } else if closeToPerfect >= 97 {
            bonusPoints = 50
        }
        score += bonusPoints
    }
    
    mutating func restart() {
        round = 1
        score = 0
        percentage = 0
        target = Int.random(in: 1...100)
    }
}

