//
//  HomePictureView.swift
//  Project1
//
//  Created by Brendan Vick on 10/26/24.
//

import SwiftUI

struct HomePictureView: View {
    
    let images: [String: String] = [
        "Home_Image": "📍 Mount Mayon - Albay, Philippines",
        "Preview_Image": "📍 Rice Steps",
        "Preview_Image2": "📍 Blue Waters",
        "Preview_Image3": "📍 Mountains and Jungle"
    ]
    
    var body: some View {
        TabView {
            ForEach(images.sorted(by: { $0.key < $1.key }), id: \.key) { image in
                ZStack {
                    Image(image.key)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: .infinity, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
                        .shadow(radius: 5)
                        .padding(.horizontal)
                    
                    VStack {
                        HStack {
                            Text(image.value)
                                .foregroundColor(.white)
                                .background(Color.black.opacity(0.2))
                                .multilineTextAlignment(.leading)
                                .padding()
                            Spacer()
                        }
                        Spacer()
                    }
                }
            }
        }
        .tabViewStyle(.page)
    }
}
