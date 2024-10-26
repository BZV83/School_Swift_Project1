//
//  Project1App.swift
//  Project1
//
//  Created by Brendan Vick on 10/10/24.
//

import SwiftUI

@main
struct LanguageLearningApp: App {
    @StateObject private var learnTagalogViewModel = LearnTagalogViewModel()
    
    var body: some Scene {
        WindowGroup {
            LearnTagalogHomeView()
                .environmentObject(learnTagalogViewModel)
        }
    }
}
