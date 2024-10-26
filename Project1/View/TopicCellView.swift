//
//  TopicCellView.swift
//  Project1
//
//  Created by Brendan Vick on 10/26/24.
//

import SwiftUI

struct TopicCell: View {
    
    @EnvironmentObject var learnTagalogViewModel: LearnTagalogViewModel
    let topicName: String
    let topicImage: String
    
    var body: some View {
        ZStack {
            Image(topicImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: .infinity, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 2))

            Text(topicName)
                .font(.headline)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .background(Color.black.opacity(0.7))
                .padding(5)
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
