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
    
    var body: some View {
            NavigationStack {
                Text("\(learnTagalogViewModel.getTopic(by: topicName)?.lessonText ?? "")")
                VStack {
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
                }
            }
            .navigationTitle("\(learnTagalogViewModel.getTopic(by: topicName)?.name ?? "")")
        }
    }
