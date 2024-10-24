//
//  TopicSelectorView.swift
//  Project1
//
//  Created by Brendan Vick on 10/22/24.
//

import SwiftUI

struct TopicSelectorView: View {
    let columnLayout = Array(repeating: GridItem(), count: 2)
    
    let learnTagalogViewModel: LearnTagalogViewModel

    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    // Define the grid layout with 2 columns
                    let columns = [
                        GridItem(),
                        GridItem()
                    ]
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(learnTagalogViewModel.topics.sorted(by: { $0.name < $1.name }), id: \.name) { topic in
                            
                            NavigationLink {
                                TopicLessonView(
                                    learnTagalogViewModel: LearnTagalogViewModel(),
                                    topicName: topic.name
                                )
                            } label: {
                                TopicCell(
                                    learnTagalogViewModel: LearnTagalogViewModel(),
                                    topicName: topic.name,
                                    topicImage: topic.image
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

struct TopicCell: View {
    
    let learnTagalogViewModel: LearnTagalogViewModel
    let topicName: String
    let topicImage: String
    
    var body: some View {
        ZStack {
            Image(topicImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: .infinity, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 2))

            Text(topicName)
                .font(.headline)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .background(Color.black.opacity(0.7))
                .padding(5)
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
//            .overlay(
//                Group {
//                    if tasksCompleted {
//                        Image(systemName: "checkmark.circle.fill")
//                            .resizable()
//                            .frame(width: 24, height: 24)
//                            .foregroundColor(.green)
//                            .padding(8)
//                    }
//                }
//                    .padding(.bottom, 1)
//                    .padding(.trailing, 1)
//                , alignment: .bottomTrailing
//            )
    }
}
