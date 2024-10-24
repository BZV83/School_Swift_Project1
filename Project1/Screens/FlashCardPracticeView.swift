//
//  FlashCardView.swift
//  Project1
//
//  Created by Brendan Vick on 10/17/24.
//

import SwiftUI

struct FlashCardPracticeView: View {
    
    let learnTagalogViewModel: LearnTagalogViewModel
    let topicName: String
    
    var body: some View {
        NavigationStack {
            List(learnTagalogViewModel.getTopic(by: topicName)?.vocab ?? []) { vocab in
                Text(vocab.englishWord)
            }
            .listStyle(.plain)
            .navigationTitle(topicName)
        }
    }
}
