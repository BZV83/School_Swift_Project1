//
//  ContentView.swift
//  Project1
//
//  Created by Brendan Vick on 10/10/24.
//

import SwiftUI



struct ContentView: View {
    let columnLayout = Array(repeating: GridItem(), count: 2)
    
    let topics: [String: String] = TempModel.init().topics

    var body: some View {
        NavigationStack {
            ScrollView {
                // Define the grid layout with 2 columns
                let columns = [
                    GridItem(),
                    GridItem()
                ]
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(topics.sorted(by: { $0.key < $1.key }), id: \.key) { topics, picture in
                        TopicCell(topic: topics, picture: picture)
                    }
                }
                .padding()
            }
            .navigationTitle("Learn Tagalog")
        }
    }
}

struct TopicCell: View {
    var topic: String
    var picture: String
    
    var body: some View {
        NavigationLink {
            TopicLessonView(topic: topic)
        } label: {
            ZStack {
                Image(picture)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    //.scaledToFit()
                    .frame(width: .infinity, height:100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 2))

                Text(topic)
                    .font(.headline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .background(Color.black.opacity(0.7))
            }
    //        .padding()
            .background(Color.white)
            .frame(width: .infinity, height: .infinity)
            .cornerRadius(10)
            .shadow(radius: 5)
        }
    }
}

struct TopicLessonView: View {
    let topic: String
    var body: some View {
        VStack {
            Text("Lesson about topic \(topic) goes here.")
            NavigationLink {
                QuizScreen()
            } label: {
                Text("Take Quiz")
            }
        }
        .navigationTitle("\(topic)")
    }
}

struct QuizScreen: View {
    var body: some View {
        VStack {
            Form {
                Section {
                    Text("Question")
                }
                Section {
                    Text("A: Answer")
                    Text("B: Answer")
                    Text("C: Answer")
                    Text("D: Answer")
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
