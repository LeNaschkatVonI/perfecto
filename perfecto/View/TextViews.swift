//
//  TextViews.swift
//  perfecto
//
//  Created by Максим Нуждин on 11.05.2021.
//

import SwiftUI

struct InstructionText: View {
    
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(3.0)
            .multilineTextAlignment(.center)
            .font(.title2)
            .padding(.leading, 30)
            .padding(.trailing, 30)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigNumberText: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
            .padding(5)
            .foregroundColor(Color("TextColor"))
    }
}

struct SliderValueText: View {
    
    var number: String
    
    var body: some View {
        Text(number)
            .bold()
            .foregroundColor(Color("TextColor"))
            .frame(width: 40.0)
    }
}

struct BodyText: View {
    
    var text: String
    var body: some View {
        Text(text)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .font(.subheadline)
            .lineSpacing(15)
        
    }
}

struct PercentageText: View {
    
    var percentage: Double
    var body: some View {
        Text(String(percentage))
            .bold()
            .font(.title3)
            .kerning(-1.0)
            .foregroundColor(Color("TextColor"))
        
    }
}

struct DateText: View {
    
    var date: Date
    var body: some View {
        Text(date, style: .time)
            .bold()
            .font(.title3)
            .kerning(-1.0)
            .foregroundColor(Color("TextColor"))
        
    }
}

struct ButtonText: View {
    
    var text: String
    var body: some View {
        Text(text)
            .bold()
            .padding()
            .background(Color("TextColor"))
            .foregroundColor(.white)
            .cornerRadius(15)
    }
}

struct BigBoldText: View {
     
    var text: String
    var body: some View {
        Text(text)
            .fontWeight(.black)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .foregroundColor(Color("TextColor"))
            .kerning(2.1)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "bullseye")
            BigNumberText(text: "42")
            SliderValueText(number: "100")
            BodyText(text: "bodytext \n 🤯😥🤯")
            ButtonText(text: "button")
            DateText(date: Date())
            PercentageText(percentage: 50.9)
            BigBoldText(text: "Leaderboard")
        }
        .padding()
    }
}
