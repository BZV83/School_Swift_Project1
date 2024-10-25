//
//  QuizScreen.swift
//  Project1
//
//  Created by Brendan Vick on 10/17/24.
//

import SwiftUI

struct QuizScreenView: View {
    
    let learnTagalogViewModel: LearnTagalogViewModel
    let topicName: String
    @State private var currentIndex: Int = 0
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            if let question = learnTagalogViewModel.getCurrentQuestion(by: topicName, and: currentIndex) {
                Form {
                    Section {
                        Text("\(question.question)")
                    }
                    Section {
                        if let answers = question.answers {
                            ForEach(answers, id: \.self) { answer in
                                Text("\(answer)")
                            }
                        } else {
                            Text("No answers available.")
                        }
                    }
                    Section {
                        Button(action: {
                            nextQuestion()
                        }) {
                            Text(currentIndex < learnTagalogViewModel.getTotalQuestions(by: topicName) - 1 ? "Next Question" : "Finish Quiz")
                        }
                    }
                }
            } else {
                Text("Place holder for progress check")
            }
        }
        .navigationTitle("Quiz for \(topicName)")
        .onAppear {
            currentIndex = 0
        }
    }
    
    private func nextQuestion() {
        if currentIndex < learnTagalogViewModel.getTotalQuestions(by: topicName) - 1 {
            currentIndex += 1
        }
        else if currentIndex == learnTagalogViewModel.getTotalQuestions(by: topicName) - 1 {
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    private func checkForLastQuestion() -> Bool {
        if currentIndex == learnTagalogViewModel.getTotalQuestions(by: topicName) - 1 {
            return true
        } else {
            return false
        }
    }
}

struct EndScreenView: View {
    var body: some View {
        VStack {
            Text("EndScreenView")
        }
    }
}
