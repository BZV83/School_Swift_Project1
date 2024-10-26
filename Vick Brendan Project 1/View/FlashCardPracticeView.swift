//
//  FlashCardView.swift
//  Project1
//
//  Created by Brendan Vick on 10/17/24.
//

import SwiftUI

struct FlashCardPracticeView: View {
    
    @EnvironmentObject var learnTagalogViewModel: LearnTagalogViewModel
    
    @State private var selectedIndex: Int = 0
    @State private var shuffledVocab: [LearnTagalogModel.VocabCardContent] = []
    
    let topicName: String
    var flashCardsStudied: Bool {
        learnTagalogViewModel.progress(for: topicName).vocabStudied
    }
    
    var body: some View {
        VStack {
            
            //MARK: - Shuffled Flashcards
            if shuffledVocab.indices.contains(selectedIndex) {
                let currentCard = shuffledVocab[selectedIndex]
                CardView(
                    englishWord: currentCard.englishWord,
                    foreignWord: currentCard.foreignWord,
                    isFaceUp: currentCard.isFaceUp
                )
                .onTapGesture {
                    learnTagalogViewModel.flipCard(card: currentCard)
                }
            }
            
            //MARK: - Next and Previous
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
            
            //MARK: - Flashcard Done Toggle
            Toggle("Done studying?", isOn: Binding(
                get: { learnTagalogViewModel.progress(for: topicName).vocabStudied },
                set: { _ in learnTagalogViewModel.toggleFlashcardsStudied(for: topicName) }
            ))
            .padding()
        }
        .onAppear {
            shuffledVocab = learnTagalogViewModel.getShuffledVocab(by: topicName)
            selectedIndex = 0
        }
    }
}

//MARK: - Animated Card
struct CardView: View {

    var englishWord: String
    var foreignWord: String
    var isFaceUp: Bool
    
    @State private var rotation: Double = 0.0
    
    var body: some View {
        ZStack {
            if rotation >= 90 {
                CardContent(word: foreignWord)
                    .rotation3DEffect(.degrees(180), axis: (0, 1, 0))
            } else {
                CardContent(word: englishWord)
            }
        }
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 5)
        .padding()
        .rotation3DEffect(
            .degrees(rotation),
            axis: (0, 1, 0)
        )
        .onAppear {
            rotation = isFaceUp ? 0 : 180
        }
        .onChange(of: isFaceUp) {
            withAnimation(.easeInOut) {
                rotation = isFaceUp ? 0 : 180
            }
        }
        .onAnimationCompleted(for: rotation) {
            if rotation == 180 {
                withAnimation {
                    rotation = 0
                }
            }
        }
    }
}

struct CardContent: View {
    var word: String
    
    var body: some View {
        VStack {
            ZStack {
                Text(word)
                    .font(.title)
                    .padding()
                Image("")
                    .resizable()
                    .scaledToFit()
                    .frame(width: .infinity, height: .infinity)
                    .padding()
            }
        }
    }
}
