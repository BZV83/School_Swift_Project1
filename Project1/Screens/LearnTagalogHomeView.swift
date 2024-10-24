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
            TopicSelectorView(learnTagalogViewModel: LearnTagalogViewModel())
    }
}

#Preview {
    LearnTagalogHomeView(learnTagalogViewModel: LearnTagalogViewModel())
}
