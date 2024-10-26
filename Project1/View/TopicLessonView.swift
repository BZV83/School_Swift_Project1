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
    @State private var doneWithLesson: Bool = false
    
    var body: some View {
            NavigationStack {
                VStack {
                    Text("\(learnTagalogViewModel.getTopic(by: topicName)?.lessonText ?? "")")
                        .padding()
                    
                    List {
                        NavigationLink {
                            FlashCardPracticeView(
                                learnTagalogViewModel: _learnTagalogViewModel,
                                topicName: learnTagalogViewModel.getTopic(by: topicName)?.name ?? ""
                            )
                        } label: {
                            Text("Practice with Flashcards")
                        }
                        
                        NavigationLink {
                            QuizScreenView(
                                learnTagalogViewModel: _learnTagalogViewModel,
                                topicName: learnTagalogViewModel.getTopic(by: topicName)?.name ?? ""
                            )
                        } label: {
                            Text("Take Quiz")
                        }
                    }
                    .listStyle(.plain)
                    
                    IndividualTopicProgressView(
                        learnTagalogViewModel: _learnTagalogViewModel,
                        topic: topicName
                    )
                }
            }
            .navigationTitle("\(learnTagalogViewModel.getTopic(by: topicName)?.name ?? "")")
        }
    }
