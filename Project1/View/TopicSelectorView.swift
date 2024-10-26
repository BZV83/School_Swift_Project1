//
//  TopicSelectorView.swift
//  Project1
//
//  Created by Brendan Vick on 10/22/24.
//

import SwiftUI

struct TopicSelectorView: View {
    let columnLayout = Array(repeating: GridItem(), count: 2)
    
    @EnvironmentObject var learnTagalogViewModel: LearnTagalogViewModel

    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    // Define the grid layout with 2 columns
                    let columns = [
                        GridItem(),
                        GridItem()
                    ]

                    HomePictureView()
                        .frame(height: 225)
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(learnTagalogViewModel.topics.sorted(by: { $0.name < $1.name }), id: \.name) { topic in
                            NavigationLink {
                                TopicLessonView(
                                    learnTagalogViewModel: _learnTagalogViewModel,
                                    topicName: topic.name
                                )
                                .toolbar(.hidden, for: .tabBar)
                            } label: {
                                
                                var itemsComplete: Bool {
                                    learnTagalogViewModel.progress(for: topic.name).lessonRead &&
                                    learnTagalogViewModel.progress(for: topic.name).vocabStudied &&
                                    learnTagalogViewModel.progress(for: topic.name).quizPassed
                                }
                                
                                TopicCell(
                                    learnTagalogViewModel: _learnTagalogViewModel,
                                    topicName: topic.name,
                                    topicImage: itemsComplete ? "100-complete" : topic.image
                                )
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Learn \(learnTagalogViewModel.languageName)")
        }
    }
}
