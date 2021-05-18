//
//  ContentView.swift
//  perfecto
//
//  Created by Максим Нуждин on 16.04.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sliderValue: Double = 50.0
    @State private var alertIsVisible: Bool = false
    @State private var leaderBoardIsVisible: Bool = false
    @State private var game: Game = Game()
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionView(game: $game)
                    .padding(.bottom, alertIsVisible ? 0 : 100)
                if alertIsVisible {
                    PointsView(game: $game, sliderValue: $sliderValue, isVisible: $alertIsVisible)
                        .transition(.scale)
                } else {
                    HitMeButton(game: $game, sliderValue: $sliderValue, isVisible: $alertIsVisible)
                        .padding()
                        .transition(.scale)
                }
                
            }
            if !alertIsVisible {
                SliderView(firstNumber: "1", secondNumber: "100", sliderValue: $sliderValue)
                    .transition(.scale)
            }
        }
    }
}
struct InstructionView: View {
    
    @Binding var game: Game
    
    var body: some View {
        VStack {
            InstructionText(text: "try to put slider as close as you can to value")
                .padding(.leading, 30)
                .padding(.trailing, 30)
            
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View {
    var firstNumber: String
    var secondNumber: String
    @Binding var sliderValue: Double
    var body: some View {
        HStack {
            SliderValueText(number: firstNumber)
            Slider(value: $sliderValue, in: 1...100)
            SliderValueText(number: secondNumber)
        }.padding()
    }
}

struct HitMeButton: View {
    
    @Binding var game: Game
    @Binding var sliderValue: Double
    @Binding var isVisible: Bool
    var roundedSliderValue: Int {
        return Int(sliderValue.rounded())
    }
    var body: some View {
        Button(action: {
            withAnimation {
                isVisible = true
            }
            game.points(sliderValue: roundedSliderValue)
            game.bonus()
        }) {
            Text("Hit me".uppercased())
                .bold()
                .font(.title3)
        }
        .padding(20.0)
        .foregroundColor(.white)
        .overlay(
            RoundedRectangle(cornerRadius: Constants.General.roundedCornerRadius)
                .strokeBorder(Color.white, lineWidth: 5)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
