//
//  TempViewModel.swift
//  Project1
//
//  Created by Brendan Vick on 10/14/24.
//

import Foundation

struct LearnTagalogViewModel {
    
    // MARK: - Properties
    
    private var lessonPlan: LessonPlan = TagalogLessonPlan(progress: [])
    
    // MARK: - Model Access
    
    var languageName: String {
        lessonPlan.languageName
    }
    var topics: [LearnTagalogModel.Topic] {
        lessonPlan.topics
    }
    
    func getTopic(by name: String) -> LearnTagalogModel.Topic? {
        if let topic = lessonPlan.topics.first(where: { $0.name == name }) {
            return topic
        }
        return nil
    }
    
    // MARK: - User Intent
    
    // MARK: - Private Helpers

}
