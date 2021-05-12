//
//  ContentView.swift
//  perfecto
//
//  Created by Максим Нуждин on 16.04.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sliderValue: Double = 50.0
    @State private var isVisible: Bool = false
    @State private var game: Game = Game()
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionView(game: $game)
                SliderView(firstNumber: "1", secondNumber: "100", sliderValue: $sliderValue)
                HitMeButton(game: $game, sliderValue: $sliderValue, isVisible: $isVisible)
                .padding()
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
            
            BigNumberText(text: "\(game.target)")
            Text("\(String(format: "%.2f", game.percentage))%")
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
            isVisible = true
            game.points(sliderValue: roundedSliderValue)
            game.target = Int.random(in: 1...100)
        }) {
            Text("Hit me".uppercased())
                .bold()
                .font(.title3)
        }
        .padding(20.0)
        .background(
            ZStack {
                Color.pink
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
            }
        )
        .foregroundColor(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(Color.white, lineWidth: 5)
        )
        .alert(isPresented: $isVisible, content: {
            return Alert(title: Text("Result"), message: Text("You have been claimed \(game.closeToPerfect) points \n Your total points sum is \(game.score)"), dismissButton: .default(Text("Dismiss")))
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
