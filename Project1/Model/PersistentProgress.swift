//
//  PersistentProgress.swift
//  Project1
//
//  Created by Brendan Vick on 10/17/24.
//

import Foundation

typealias TopicItemProgress = [String: Bool]
typealias TopicProgress = [String: TopicItemProgress]

struct PersistentProgress {
    
    // MARK: - Card Progress
    private static func flashCardProgress() -> TopicProgress {
        UserDefaults.standard.dictionary(forKey: Key.cardStudyProgress) as? TopicProgress ?? TopicProgress()
    }
    
    var cardStudyProgress = flashCardProgress() {
        didSet {
            UserDefaults.standard.set(cardStudyProgress, forKey: Key.cardStudyProgress)
        }
    }
    
    //MARK: - Lesson Progress
    private static func readProgress() -> TopicProgress {
        UserDefaults.standard.dictionary(forKey: Key.lessonProgress) as? TopicProgress ?? TopicProgress()
    }
    
    var lessonProgress = readProgress() {
        didSet {
            UserDefaults.standard.set(lessonProgress, forKey: Key.lessonProgress)
        }
    }
    
    //MARK: - High Score
    private static func highScore() -> TopicProgress {
        UserDefaults.standard.dictionary(forKey: Key.highScore) as? TopicProgress ?? TopicProgress()
    }
    
    var highScore = highScore() {
        didSet {
            UserDefaults.standard.set(highScore, forKey: Key.highScore)
        }
    }
    
    //MARK: - Quiz Passed
    private static func quizPassed() -> TopicProgress {
        UserDefaults.standard.dictionary(forKey: Key.quizPassed) as? TopicProgress ?? TopicProgress()
    }
    
    var quizPassed = quizPassed() {
        didSet {
            UserDefaults.standard.set(quizPassed, forKey: Key.quizPassed)
        }
    }

    private struct Key {
        static let lessonProgress = "Progress"
        static let highScore = "HighScore"
        static let cardStudyProgress = "FlashCardProgress"
        static let quizPassed = "QuizPassed"
    }
}
