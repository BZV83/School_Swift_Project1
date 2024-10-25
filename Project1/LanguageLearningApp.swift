//
//  Project1App.swift
//  Project1
//
//  Created by Brendan Vick on 10/10/24.
//

import SwiftUI

@main
struct LanguageLearningApp: App {
    var body: some Scene {
        WindowGroup {
            LearnTagalogHomeView(learnTagalogViewModel: LearnTagalogViewModel())
        }
    }
}
