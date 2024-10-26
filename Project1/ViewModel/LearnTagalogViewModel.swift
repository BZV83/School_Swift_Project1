//
//  TempViewModel.swift
//  Project1
//
//  Created by Brendan Vick on 10/14/24.
//

import Foundation

class LearnTagalogViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published private var lessonPlan: LessonPlan = TagalogLessonPlan(progress: [])
    private var soundPlayer = SoundPlayer()
    
    // MARK: - Model Access
    
    var languageName: String {
        lessonPlan.languageName
    }
    var topics: [LearnTagalogModel.Topic] {
        lessonPlan.topics
    }
    
    func getVocab(by topicName: String) -> [LearnTagalogModel.VocabCardContent] {
        if let vocab = lessonPlan.topics.first(where: { $0.name == topicName })?.vocab {
            return vocab.shuffled()
        }
        return []
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
    
    func getScore(by name: String) -> Int {
        lessonPlan.topics.first(where: { $0.name == name })?.quizScore ?? 0
    }
    
    func setScore(by name: String, _ score: Int) {
    }
    
    func getShuffledVocab(by topicName: String) -> [LearnTagalogModel.VocabCardContent] {
        if let vocab = lessonPlan.topics.first(where: { $0.name == topicName })?.vocab {
            return vocab.shuffled()
        }
        return []
    }
    
    func progress(for name: String) -> LearnTagalogModel.Progress {
        if let progressRecord = lessonPlan.progress.first(where: { $0.topicName == name }) {
            return progressRecord
        }
        let progressRecord = LearnTagalogModel.Progress(topicName: name)
        
        lessonPlan.progress.append(progressRecord)
        
        return progressRecord
    }
    
    // MARK: - User Intent
    
    func handleChosenAnswer(for answer: String, and correctAnswer: String) {
        if answer == correctAnswer {
            Task {
                await soundPlayer.playSound(named: "correct.m4a")
            }
        } else {
            Task {
                await soundPlayer.playSound(named: "wrong.m4a")
            }
        }
    }
    
    func flipCard(card: LearnTagalogModel.VocabCardContent) {
        lessonPlan.flipCard(for: card)
    }
    
    func toggleLessonRead(for name: String) {
        lessonPlan.toggleLessonRead(for: name)
    }
    
    func toggleFlashcardsStudied(for name: String) {
        lessonPlan.toggleFlashcardsStudied(for: name)
    }
    
    func toggleQuizTaken(for name: String) {
        lessonPlan.toggleQuizTaken(for: name)
    }
    
    // MARK: - Private Helpers

}
