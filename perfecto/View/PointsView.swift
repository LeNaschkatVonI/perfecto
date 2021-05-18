//
//  PointsView.swift
//  perfecto
//
//  Created by Максим Нуждин on 14.05.2021.
//

import SwiftUI

struct PointsView: View {
    
    @Binding var game: Game
    @Binding var sliderValue: Double
    @Binding var isVisible: Bool
    
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        VStack(spacing: 10) {
            InstructionText(text: "alert")
            BigNumberText(text: String(roundedValue))
            BodyText(text: "You have been scored\n \(points)")
            Button(action :{
                withAnimation {
                    isVisible = false
                }
                game.startNewRound()
                game.updatePercentage()
                
            }) {
                ButtonText(text: "HIT ME")
            }
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color("Tint"))
        .cornerRadius(Constants.General.roundedCornerRadius)
        .shadow(radius: 10, x: 5, y: 5)
        .transition(.scale)
    }
}

struct PointsView_Previews: PreviewProvider {
    
    static private var game = Binding.constant(Game())
    static private var sliderValue = Binding.constant(50.0)
    static private var isVisible = Binding.constant(false)
    
    static var previews: some View {
        PointsView(game: game, sliderValue: sliderValue, isVisible: isVisible)
        PointsView(game: game, sliderValue: sliderValue, isVisible: isVisible).preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        PointsView(game: game, sliderValue: sliderValue, isVisible: isVisible)
            .previewLayout(.fixed(width: 560, height: 320))
        PointsView(game: game, sliderValue: sliderValue, isVisible: isVisible)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            .previewLayout(.fixed(width: 560, height: 320))
    }
}
