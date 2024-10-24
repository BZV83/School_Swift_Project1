//
//  OverallProgressView.swift
//  Project1
//
//  Created by Brendan Vick on 10/22/24.
//

import SwiftUI

struct OverallProgressView: View {
    
    let learnTagalogViewModel: LearnTagalogViewModel
    
    var body: some View {
        VStack {
            Form {
                ForEach(learnTagalogViewModel.topics.sorted(by: { $0.name < $1.name }), id: \.name) { topics in
                    Text("\(topics.name)")
                }
            }
            .navigationTitle("Overall Progress")
        }
    }
}
