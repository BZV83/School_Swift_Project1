//
//  TopicSelectorView.swift
//  Project1
//
//  Created by Brendan Vick on 10/22/24.
//

import SwiftUI

struct TopicSelectorView: View {
    let columnLayout = Array(repeating: GridItem(), count: 2)
    
    let topics: [LearnTagalog.Topic] = LearnTagalogViewModel.init().topics

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
                        ForEach(topics.sorted(by: { $0.id < $1.id }), id: \.id) { topics in
                            TopicCell(topic: topics)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Learn Tagalog")
        }
    }
}

struct TopicCell: View {
    var topic: LearnTagalog.Topic
    @State var tasksCompleted: Bool = true
    
    var body: some View {
        NavigationLink {
            TopicLessonView(topic: topic)
        } label: {
            ZStack {
                Image(topic.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: .infinity, height:100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 2))

                Text(topic.name)
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
}
