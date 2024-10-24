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
    
    func getQuestion(by name: String, and questionNum: Int) -> LearnTagalogModel.QuizItem? {
        if let question = lessonPlan.topics.first(where: { $0.name == name })?.quiz[questionNum] {
            return question
        }
        return nil
    }
    
    func getTotalQuestions(by name: String) -> Int {
        if let topic = lessonPlan.topics.first(where: { $0.name == name }) {
            return topic.quiz.count
        }
        return 0
    }
    
    func getCurrentQuestion(by name: String, and index: Int) -> LearnTagalogModel.QuizItem? {
        guard let topic = lessonPlan.topics.first(where: { $0.name == name }) else { return nil }
        return topic.quiz.indices.contains(index) ? topic.quiz[index] : nil
    }
    
    // MARK: - User Intent
    
    
    
    // MARK: - Private Helpers

}
