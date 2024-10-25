//
//  IndividualTopicProgress.swift
//  Project1
//
//  Created by Brendan Vick on 10/22/24.
//

import SwiftUI

struct IndividualTopicProgressView: View {
    
    let learnTagalogViewModel: LearnTagalogViewModel
    var topic: String?
    
    var body: some View {
        ZStack {
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: .infinity, height: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding()
            
            Text("\(topic ?? "No Topic")")
                .foregroundColor(.white)
                .background(Color.blue)
        }
    }
}
