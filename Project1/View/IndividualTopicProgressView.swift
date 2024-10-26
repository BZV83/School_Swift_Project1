//
//  IndividualTopicProgress.swift
//  Project1
//
//  Created by Brendan Vick on 10/22/24.
//

import SwiftUI

struct IndividualTopicProgressView: View {
    
    @EnvironmentObject var learnTagalogViewModel: LearnTagalogViewModel
    var topic: String?
    var lessonRead: Bool {
        learnTagalogViewModel.progress(for: topic ?? "").lessonRead
    }
    var flashCardsStudied: Bool {
        learnTagalogViewModel.progress(for: topic ?? "").vocabStudied
    }
    var quizTaken: Bool {
        learnTagalogViewModel.progress(for: topic ?? "").quizPassed
    }
    
    var body: some View {
        VStack {
            List {
                
                Toggle("Lesson read?", isOn: Binding(
                    get: { learnTagalogViewModel.progress(for: topic ?? "").lessonRead },
                    set: { _ in
                        learnTagalogViewModel.toggleLessonRead(for: topic ?? "")
                    }
                ))
                
                Toggle("Flashcards studied?", isOn: Binding(
                    get: { learnTagalogViewModel.progress(for: topic ?? "").vocabStudied },
                    set: { _ in
                        learnTagalogViewModel.toggleFlashcardsStudied(for: topic ?? "")
                    }
                ))
                
                Toggle("Quiz taken?", isOn: Binding(
                    get: { learnTagalogViewModel.progress(for: topic ?? "").quizPassed },
                    set: { _ in
                        learnTagalogViewModel.toggleQuizTaken(for: topic ?? "")
                    }
                ))
                Text("Quiz high score: ")
            }
            .listStyle(.plain)
        }
    }
}
