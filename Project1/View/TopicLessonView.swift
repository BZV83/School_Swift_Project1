//
//  TopicLessonView.swift
//  Project1
//
//  Created by Brendan Vick on 10/16/24.
//

import SwiftUI

struct TopicLessonView: View {
    
    let learnTagalogViewModel: LearnTagalogViewModel
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
                                learnTagalogViewModel: LearnTagalogViewModel(),
                                topicName: learnTagalogViewModel.getTopic(by: topicName)?.name ?? ""
                            )
                        } label: {
                            Text("Practice with Flashcards")
                        }
                        
                        NavigationLink {
                            QuizScreenView(
                                learnTagalogViewModel: LearnTagalogViewModel(),
                                topicName: learnTagalogViewModel.getTopic(by: topicName)?.name ?? ""
                            )
                        } label: {
                            Text("Take Quiz")
                        }
                        
                        HStack {
                            Text("Done with lesson?")
                            Toggle(isOn: $doneWithLesson) {
                                Text("")
                            }
                        }
                        
                        IndividualTopicProgressView(
                            learnTagalogViewModel: LearnTagalogViewModel(),
                            topic: topicName
                        )
                    }
                }
            }
            .navigationTitle("\(learnTagalogViewModel.getTopic(by: topicName)?.name ?? "")")
        }
    }
