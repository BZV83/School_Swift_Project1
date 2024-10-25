//
//  FlashCardView.swift
//  Project1
//
//  Created by Brendan Vick on 10/17/24.
//

import SwiftUI

struct FlashCardPracticeView: View {
    
    let learnTagalogViewModel: LearnTagalogViewModel
    let topicName: String
    var isFaceUp: Bool = false
    @State private var completedFlashCards: Bool = false
    
    var body: some View {
        VStack {
            TabView {
                ForEach(learnTagalogViewModel.getTopic(by: topicName)?.vocab ?? []) { words in
                    CardView(
                        englishWord: words.englishWord,
                        foreignWord: words.foreignWord,
                        isFaceUp: isFaceUp
                    )
                    .onTapGesture {
                        
                    }
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
            HStack {
                Text("Done studying?")
                Toggle(isOn: $completedFlashCards) {
                    Text("")
                }
            }
            .padding()
        }
    }
}

struct CardView: View {

    var englishWord: String
    var foreignWord: String
    var isFaceUp: Bool
    
    var body: some View {
        if isFaceUp {
            VStack {
                ZStack {
                    Text("\(englishWord)")
                        .font(.title)
                        .padding()
                    Image("")
                        .resizable()
                        .scaledToFit()
                        .frame(width: .infinity, height: .infinity)
                        .padding()
                }
            }
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 5)
            .padding()
        } else {
            VStack {
                ZStack {
                    Text("\(foreignWord)")
                        .font(.title)
                        .padding()
                    Image("")
                        .resizable()
                        .scaledToFit()
                        .frame(width: .infinity, height: .infinity)
                        .padding()
                }
            }
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 5)
            .padding()
        }
        
    }
}
