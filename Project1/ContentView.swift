//
//  ContentView.swift
//  Project1
//
//  Created by Brendan Vick on 10/10/24.
//

import SwiftUI

let topics = [
    "Basic Greetings and Farewells",
    "Common Phrases",
    "Numbers",
    "Colors",
    "Family Members",
    "Food and Drink",
    "Common Adjectives",
    "Days of the Week",
    "Weather Vocab",
    "Common Verbs"
]

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(topics, id: \.self) { topic in
                TopicCell(topic: topic)
            }
            .listStyle(.plain)
            .navigationTitle("SwiftUI Vocabulary")
        }
    }
}

struct TopicCell: View {
    let topic: String
    
    var body: some View {
        HStack {
            NavigationLink {
                TopicLessonView(topic: topic)
            } label: {
                Text(topic)
            }
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
