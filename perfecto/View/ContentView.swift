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
    var roundedSliderValue: Int {
        return Int(sliderValue.rounded())
    }
    
    var body: some View {
        VStack {
            Spacer()
            Text("try to put slider as close \nas you can to value")
                .bold()
                .kerning(3.0)
                .multilineTextAlignment(.center)
                .font(.title2)
            
            Text("\(game.target)")
                .kerning(-1.0)
                .font(.largeTitle)
                .fontWeight(.black)
                .padding(5)
            
            Text("\(String(format: "%.2f", game.percentage))%")
            
            HStack{
                Text("1")
                    .bold()
                Slider(value: $sliderValue, in: 1...100)
                Text("100")
                    .bold()
            }
            RoundedRectangle(cornerRadius: 20.0)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .overlay(Button(action: {
                    isVisible = true
                    game.points(sliderValue: roundedSliderValue)
                    game.target = Int.random(in: 1...100)
                }) {
                    Text("Hit me").foregroundColor(.pink)
                        .bold()
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                })
                .alert(isPresented: $isVisible, content: {
                    return Alert(title: Text("Result"), message: Text("You have been claimed \(roundedSliderValue) points \n Your total points sum is \(game.score)"), dismissButton: .default(Text("Dismiss")))
                })
            Spacer()
            HStack {
                infoTextShape(info: "Your score is \n \(game.score)")
                infoTextShape(info: "Your percentage is \(String(format: "%.2f", game.percentage))%")
                infoTextShape(info: "Your score is \n \(game.score)")            }
        }
        .foregroundColor(.white)
        .padding(10)
        .background(Image("elainaBackground").resizable()
                        .ignoresSafeArea()
                        .blur(radius: 20))
        .statusBar(hidden: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
