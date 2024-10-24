//
//  ContentView.swift
//  Project1
//
//  Created by Brendan Vick on 10/10/24.
//

import SwiftUI

struct LearnTagalogHomeView: View {
    
    var learnTagalogViewModel: LearnTagalogViewModel
    
    var body: some View{
        TabView {
            TopicSelectorView(learnTagalogViewModel: LearnTagalogViewModel())
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            OverallProgressView(learnTagalogViewModel: LearnTagalogViewModel())
                .tabItem {
                    Label("Overall Progress", systemImage: "chart.bar.fill")
                }
        }
    }
}

#Preview {
    LearnTagalogHomeView(learnTagalogViewModel: LearnTagalogViewModel())
}
