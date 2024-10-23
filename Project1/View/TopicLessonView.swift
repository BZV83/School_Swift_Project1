//
//  TopicLessonView.swift
//  Project1
//
//  Created by Brendan Vick on 10/16/24.
//

import SwiftUI

struct TopicLessonView: View {
    let topic: LearnTagalog.Topic
    var body: some View {
        NavigationStack {
            Text("Lesson about topic \(topic.name) goes here.")
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
        .navigationTitle("\(topic.name)")
    }
}
