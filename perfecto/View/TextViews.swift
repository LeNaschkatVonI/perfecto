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


struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        
        InstructionText(text: "bullseye")
        BigNumberText(text: "42")
        SliderValueText(number: "100")
    }
}
