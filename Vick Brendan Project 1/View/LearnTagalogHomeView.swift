//
//  ContentView.swift
//  Project1
//
//  Created by Brendan Vick on 10/10/24.
//

import SwiftUI

struct LearnTagalogHomeView: View {
    
    @State private var isNavigating = false
    @EnvironmentObject var learnTagalogViewModel: LearnTagalogViewModel

    var body: some View{
            TopicSelectorView(
                learnTagalogViewModel: _learnTagalogViewModel
            )
    }
}

#Preview {
    LearnTagalogHomeView()
        .environmentObject(LearnTagalogViewModel())
}
