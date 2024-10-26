//
//  QuizScreen.swift
//  Project1
//
//  Created by Brendan Vick on 10/17/24.
//

import SwiftUI

struct QuizScreenView: View {
    
    @EnvironmentObject var learnTagalogViewModel: LearnTagalogViewModel
    @Environment(\.presentationMode) var presentationMode
    
    let topicName: String
    
    @State private var currentIndex: Int = 0
    @State private var isShaking: Bool = false
    @State private var selectedAnswer: String? = nil
    @State private var isCorrectAnswerSelected: Bool = false
    
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
                    //MARK: - Question
                    Section {
                        Text("\(question.question)")
                    }
                    
                    //MARK: - Answers
                    Section {
                        if let answers = question.answers {
                            ForEach(answers, id: \.self) { answer in
                                Button(action: {
                                    selectedAnswer = answer
                                    if learnTagalogViewModel.handleChosenAnswer(
                                        for: topicName,
                                        question: question.question,
                                        answer: answer,
                                        correctAnswer: question.correctAnswer
                                    ) {
                                        // BUTTON ANIMATED IF CORRECT
                                        withAnimation(.default) {
                                            isShaking = true
                                            isCorrectAnswerSelected = true
                                        }
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                            withAnimation(.default) {
                                                isShaking = false
                                            }
                                        }
                                    } else {
                                        isCorrectAnswerSelected = false
                                    }
                                }) {
                                    Text("\(answer)")
                                        .modifier(ShakeEffect(shakes: isShaking && answer == question.correctAnswer ? 3 : 0))
                                }
                            }
                        } else {
                            Text("No answers available.")
                        }
                    }
                    
                    //MARK: - Next Question/Finish
                    Section {
                        Button(action: {
                            nextQuestion()
                            isCorrectAnswerSelected = false
                        }) {
                            Text(currentIndex < learnTagalogViewModel.getTotalQuestions(by: topicName) - 1 ? "Next Question" : "Finish Quiz")
                        }
                        .disabled(!isCorrectAnswerSelected)
                        
                        //Hide toggle until the end
                        if currentIndex == learnTagalogViewModel.getTotalQuestions(by: topicName) - 1 && isCorrectAnswerSelected {
                            Toggle("Quiz taken?", isOn: Binding(
                                get: { learnTagalogViewModel.progress(for: topicName).quizPassed },
                                set: { _ in
                                    learnTagalogViewModel.toggleQuizTaken(for: topicName)
                                }
                            ))
                        }
                    }
                }
            } else {
                Text("Error")
            }
            //MARK: - Score Placeholder
            HStack {
                Spacer()
                Text("Score: 100")
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
