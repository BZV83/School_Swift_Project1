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
        NavigationStack {
            VStack {
                List {
                    ForEach(learnTagalogViewModel.topics.sorted(by: { $0.name < $1.name }), id: \.name) { topics in
                        
                        NavigationLink {
                            IndividualTopicProgressView(
                                learnTagalogViewModel: LearnTagalogViewModel(),
                                topic: learnTagalogViewModel.getTopic(by: topics.name)?.name ?? ""
                            )
                        } label: {
                            Text("\(topics.name)")
                        }
                    }
                }
            }
            .navigationTitle("Overall Progress")
        }
    }
}
