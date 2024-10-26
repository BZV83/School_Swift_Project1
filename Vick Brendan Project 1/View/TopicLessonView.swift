//
//  TopicLessonView.swift
//  Project1
//
//  Created by Brendan Vick on 10/16/24.
//

import SwiftUI

struct TopicLessonView: View {
    
    @EnvironmentObject var learnTagalogViewModel: LearnTagalogViewModel
    let topicName: String
    
    var body: some View {
            NavigationStack {
                VStack {
                    
                    //MARK: - Lesson
                    Text("\(learnTagalogViewModel.getTopic(by: topicName)?.lessonText ?? "")")
                        .padding()
                    
                    List {
                        //MARK: - Flashcards
                        NavigationLink {
                            FlashCardPracticeView(
                                learnTagalogViewModel: _learnTagalogViewModel,
                                topicName: learnTagalogViewModel.getTopic(by: topicName)?.name ?? ""
                            )
                        } label: {
                            Text("Practice with Flashcards")
                        }
                        
                        //MARK: - Quiz
                        NavigationLink {
                            QuizScreenView(
                                learnTagalogViewModel: _learnTagalogViewModel,
                                topicName: learnTagalogViewModel.getTopic(by: topicName)?.name ?? ""
                            )
                        } label: {
                            Text("Take Quiz")
                        }
                        
                        //MARK: - Progress Markers
                        Toggle("Lesson read?", isOn: Binding(
                            get: { learnTagalogViewModel.progress(for: topicName).lessonRead },
                            set: { _ in
                                learnTagalogViewModel.toggleLessonRead(for: topicName)
                            }
                        ))
                        
                        Toggle("Flashcards studied?", isOn: Binding(
                            get: { learnTagalogViewModel.progress(for: topicName).vocabStudied },
                            set: { _ in
                                learnTagalogViewModel.toggleFlashcardsStudied(for: topicName)
                            }
                        ))
                        
                        Toggle("Quiz taken?", isOn: Binding(
                            get: { learnTagalogViewModel.progress(for: topicName).quizPassed },
                            set: { _ in
                                learnTagalogViewModel.toggleQuizTaken(for: topicName)
                            }
                        ))
                        Text("Quiz high score: 100,000")
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("\(learnTagalogViewModel.getTopic(by: topicName)?.name ?? "")")
        }
    }
