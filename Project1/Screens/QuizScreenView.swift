//
//  QuizScreen.swift
//  Project1
//
//  Created by Brendan Vick on 10/17/24.
//

import SwiftUI

struct QuizScreenView: View {
    var body: some View {
        VStack {
            Form {
                Section {
                    Text("Question")
                }
                Section {
                    Text("A: Answer")
                    Text("B: Answer")
                    Text("C: Answer")
                    Text("D: Answer")
                }
            }
        }
    }
}
