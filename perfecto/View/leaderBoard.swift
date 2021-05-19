//
//  leaderBoard.swift
//  perfecto
//
//  Created by Максим Нуждин on 17.05.2021.
//

import SwiftUI

struct leaderBoardView: View {
    
    @Binding var game: Game
    
    var body: some View {
        ZStack {
            Color("Tint").edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack(spacing: 10) {
                HeaderView()
                labelView()
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(game.leaderBoardEntries.indices) { i in
                            let leaderBoardEntry = game.leaderBoardEntries[i]
                            RowView(index: i, percentage: Double(leaderBoardEntry.percentage), date: leaderBoardEntry.date)
                        }
                    }
                }
            }
        }
    }
}

struct HeaderView: View {
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        ZStack {
            HStack {
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    BigBoldText(text: "LeaderBoard")
                        .padding(.leading)
                    Spacer()
                } else {
                    BigBoldText(text: "LeaderBoard")
                }
            }
            HStack {
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    RoundButtonFilled(systemName: "xmark")
                        .padding(.trailing)
                }
            }
        }
    }
}

struct labelView: View {
    
    var body: some View {
        HStack {
            Spacer()
                .frame(width: Constants.General.roundRectViewWidth)
            Spacer()
            BodyText(text: "Score")
                .frame(width: Constants.leaderBoard.leaderBoardScoreWidth)
            Spacer()
            BodyText(text: "Date")
                .frame(width: Constants.leaderBoard.leaderBoardDateWidth)
        }
        .padding()
        .frame(maxWidth: Constants.leaderBoard.leaderBoardMaxRowWidth)
    }
}

struct RowView: View {
    
    var index: Int
    var percentage: Double
    var date: Date
    
    var body: some View {
        HStack {
            RoundedTextView(text: String(index))
            Spacer()
            PercentageText(percentage: percentage)
                .frame(width: Constants.leaderBoard.leaderBoardScoreWidth)
            Spacer()
            DateText(date: date)
                .frame(width: Constants.leaderBoard.leaderBoardDateWidth)
            
        }
        .background(RoundedRectangle(cornerRadius: .infinity)
                        .strokeBorder(Color("rowViewColor"), lineWidth: Constants.General.strokeWidth))
        .frame(maxWidth: Constants.leaderBoard.leaderBoardMaxRowWidth)
        
    }
}

struct leaderBoard_Previews: PreviewProvider {
    static private var game = Binding.constant(Game())
    static var previews: some View {
        leaderBoardView(game: game)
        leaderBoardView(game: game).preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        leaderBoardView(game: game)
            .previewLayout(.fixed(width: 560, height: 320))
        leaderBoardView(game: game)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            .previewLayout(.fixed(width: 560, height: 320))
    }
}
