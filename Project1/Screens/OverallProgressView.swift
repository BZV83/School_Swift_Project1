//
//  OverallProgressView.swift
//  Project1
//
//  Created by Brendan Vick on 10/22/24.
//

import SwiftUI

struct OverallProgressView: View {
    
    let topics: [LearnTagalogModel.Topic] = LearnTagalogViewModel.init().topics
    
    var body: some View {
        VStack {
            Form {
                ForEach(topics.sorted(by: { $0.id < $1.id }), id: \.id) { topics in
                    Text("\(topics.name)")
                }
            }
            .navigationTitle("Overall Progress")
        }
    }
}
