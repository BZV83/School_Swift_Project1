//
//  ContentView.swift
//  Project1
//
//  Created by Brendan Vick on 10/10/24.
//

import SwiftUI

struct LearnTagalogHomeView: View {
    var body: some View{
        TabView {
            TopicSelectorView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            OverallProgressView()
                .tabItem {
                    Label("Progress", systemImage: "pencil.and.outline")
                }
        }
    }
}

#Preview {
    LearnTagalogHomeView()
}
