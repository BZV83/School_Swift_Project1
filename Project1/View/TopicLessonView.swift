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
                Text("\(learnTagalogViewModel.getTopic(by: topicName)?.name ?? "No Topic Found")")
                VStack {
                    NavigationLink {
                        FlashCardPracticeView()
                    } label: {
                        Text("Practice with Flashcards")
                    }
                    NavigationLink {
                        QuizScreenView()
                    } label: {
                        Text("Take Quiz")
                    }
                }
            }
            .navigationTitle("\(String(describing: learnTagalogViewModel.getTopic(by: topicName)?.name ?? ""))")
        }
    }
