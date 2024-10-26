//
//  QuizScreen.swift
//  Project1
//
//  Created by Brendan Vick on 10/17/24.
//

import SwiftUI

struct QuizScreenView: View {
    
    @EnvironmentObject var learnTagalogViewModel: LearnTagalogViewModel
    let topicName: String
    @State private var currentIndex: Int = 0
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            
            ZStack {
                //let animation = Animation.easeInOut(duration: 0.1)
                
                Pie(
                    startAngle: angle(for: 0),
                    endAngle: angle(for: 0.3)
                )
                    .padding()
                    .opacity(0.5)
                    .frame(width: 100, height:  100)
                Text("")
                    .font(.largeTitle)
            }
            
            if let question = learnTagalogViewModel.getCurrentQuestion(by: topicName, and: currentIndex) {
                Form {
                    Section {
                        Text("\(question.question)")
                    }
                    
                    Section {
                        if let answers = question.answers {
                            ForEach(answers, id: \.self) { answer in
                                Button(action: {
                                    learnTagalogViewModel.handleChosenAnswer(for: answer, and: question.correctAnswer)
                                }) {
                                    Text("\(answer)")
                                }
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
            
            HStack {
                Spacer()
                Text("Score: \(learnTagalogViewModel.getScore(by: topicName))")
            }
            .padding()
        }
        .navigationTitle("Quiz for \(topicName)")
        .onAppear {
            currentIndex = 0
        }
    }
    
    // MARK: - Helpers
    
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
    
    private func angle(for percentOfCircle: Double) -> Angle {
        Angle.degrees(percentOfCircle * 360 - 90)
    }
}

struct EndScreenView: View {
    var body: some View {
        VStack {
            Text("EndScreenView")
        }
    }
}
