//
//  FlashCardView.swift
//  Project1
//
//  Created by Brendan Vick on 10/17/24.
//

import SwiftUI

struct FlashCardPracticeView: View {
    
    @ObservedObject var learnTagalogViewModel: LearnTagalogViewModel
    let topicName: String
    @State private var selectedIndex: Int = 0
    @State private var completedFlashCards: Bool = false
    
    var body: some View {
        VStack {
            if let vocab = learnTagalogViewModel.getTopic(by: topicName)?.vocab, vocab.indices.contains(selectedIndex) {
                let currentCard = vocab[selectedIndex]
                
                CardView(
                    englishWord: currentCard.englishWord,
                    foreignWord: currentCard.foreignWord,
                    isFaceUp: currentCard.isFaceUp
                )
                .onTapGesture {
                    learnTagalogViewModel.flipCard(card: currentCard)
                }
            }
            HStack {
                Button(action: {
                    if selectedIndex > 0 {
                        selectedIndex -= 1
                    }
                }) {
                    Text("Previous")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(selectedIndex <= 0 ? Color.gray : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 2)
                }
                .disabled(selectedIndex <= 0)
                .padding()
                
                Spacer()
                
                Button(action: {
                    if let vocab = learnTagalogViewModel.getTopic(by: topicName)?.vocab, selectedIndex < vocab.count - 1 {
                        selectedIndex += 1
                    }
                }) {
                    Text("Next")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity) // Make the button stretch
                        .background(selectedIndex >= (learnTagalogViewModel.getTopic(by: topicName)?.vocab.count ?? 0) - 1 ? Color.gray : Color.blue) // Change color based on state
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 2)
                }
                .padding()
                .disabled(selectedIndex >= (learnTagalogViewModel.getTopic(by: topicName)?.vocab.count ?? 0) - 1)
            }
            
            HStack {
                Text("Done studying?")
                Toggle(isOn: $completedFlashCards) {
                    Text("")
                }
            }
            .padding()
        }
        .onAppear {
            // Ensure the initial selected index is correct when the view appears
            if let index = learnTagalogViewModel.getTopic(by: topicName)?.vocab.firstIndex(where: { $0.isFaceUp }) {
                selectedIndex = index
            }
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
                    Text(englishWord)
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
                    Text(foreignWord)
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
