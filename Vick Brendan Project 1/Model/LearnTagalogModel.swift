//
//  TempModel.swift
//  Project1
//
//  Created by Brendan Vick on 10/14/24.
//

import Foundation
import UIKit

protocol LessonPlan {
    var languageName: String { get }
    var topics: [LearnTagalogModel.Topic] { get }
    var progress: [LearnTagalogModel.Progress] { get set }
    
    mutating func flipCard(for card: LearnTagalogModel.VocabCardContent)
    mutating func toggleLessonRead(for name: String)
    mutating func toggleFlashcardsStudied(for name: String)
    mutating func toggleQuizTaken(for name: String)
}

struct LearnTagalogModel {
    struct Topic: Identifiable {
        let id = UUID()
        let name: String
        let image: String
        let lessonText: String
        var vocab: [VocabCardContent]
        let quiz: [QuizItem]
        var quizScore: Int?
    }
    
    struct QuizItem {
        var question: String
        var answers: [String]?
        var correctAnswer: String
    }
    
    class VocabCardContent: Identifiable, ObservableObject {
        let id = UUID()
        var foreignWord: String
        var englishWord: String
        var isFaceUp = true
        
        init(foreignWord: String, englishWord: String, isFaceUp: Bool = true) {
            self.foreignWord = foreignWord
            self.englishWord = englishWord
            self.isFaceUp = isFaceUp
        }
    }
    
    struct Progress {
        let topicId = UUID()
        let topicName: String
        var lessonRead = false
        var vocabStudied = false
        var quizPassed = false
        var quizHighScore: Int?
    }
}

extension LearnTagalogModel.Progress: Identifiable {
    var id: String {
        topicName
    }
}

private func key(for title: String, type: String) -> String {
    "\(title).\(type)"
}

struct TagalogLessonPlan: LessonPlan {
    
    // MARK: - Read-only
    
    let languageName = "Tagalog"
    let topics = Data.tagalogTopics
        
    
    // MARK: - Read-write Properties
    
    var progress: [LearnTagalogModel.Progress] = TagalogLessonPlan.readProgressRecords()
    
    // MARK: - Helpers
    
    //Flip flashcard
    mutating func flipCard(for card: LearnTagalogModel.VocabCardContent) {
        card.isFaceUp.toggle()
    }
    
    mutating func toggleLessonRead(for name: String) {
        if let index = progress.firstIndex(where: { $0.topicName == name}) {
            progress[index].lessonRead.toggle()
            UserDefaults.standard
                .set(
                    progress[index].lessonRead,
                    forKey: key(for: name, type: Key.lessonProgress)
                )
        } else {
            progress.append(LearnTagalogModel.Progress(topicName: name))
            toggleLessonRead(for: name)
        }
    }
    
    mutating func toggleFlashcardsStudied(for name: String) {
        if let index = progress.firstIndex(where: { $0.topicName == name}) {
            progress[index].vocabStudied.toggle()
            UserDefaults.standard
                .set(
                    progress[index].vocabStudied,
                    forKey: key(for: name, type: Key.cardStudyProgress)
                )
        } else {
            progress.append(LearnTagalogModel.Progress(topicName: name))
            toggleFlashcardsStudied(for: name)
        }
    }
    
    mutating func toggleQuizTaken(for name: String) {
        if let index = progress.firstIndex(where: { $0.topicName == name}) {
            progress[index].quizPassed.toggle()
            UserDefaults.standard
                .set(
                    progress[index].quizPassed,
                    forKey: key(for: name, type: Key.quizPassed)
                )
        } else {
            progress.append(LearnTagalogModel.Progress(topicName: name))
            toggleQuizTaken(for: name)
        }
    }
    
    private static func readProgressRecords() -> [LearnTagalogModel.Progress] {
        var progressRecords = [LearnTagalogModel.Progress]()
        
        Data.tagalogTopics.forEach { topic in
            var progressRecord = LearnTagalogModel.Progress(topicName: topic.name)
            
            progressRecord.lessonRead = UserDefaults.standard.bool (forKey: key(for: topic.name, type: Key.lessonProgress))
            progressRecord.quizPassed = UserDefaults.standard.bool (forKey: key(for: topic.name, type: Key.quizPassed))
            progressRecord.vocabStudied = UserDefaults.standard.bool (forKey: key(for: topic.name, type: Key.cardStudyProgress))
            
            progressRecords.append(progressRecord)
        }
        
        return progressRecords
    }
    
    private struct Key {
        static let lessonProgress = "Progress"
        static let highScore = "HighScore"
        static let cardStudyProgress = "FlashCardProgress"
        static let quizPassed = "QuizPassed"
    }
}

private struct Data {
    static let tagalogTopics = [
        LearnTagalogModel.Topic(
            name: "Greetings and Farewells",
            image: "hello_picture",
            lessonText: """
            Filipino people are very kind. A greeting can go a long way. \
            Here you can find many different greetings and farewells. \
            Always remember, if a word comes up you do not know, you\
            can never go wrong by adding a "po".
            """,
            vocab: [
                LearnTagalogModel.VocabCardContent(foreignWord: "Kamusta", englishWord: "Hello"),
                LearnTagalogModel.VocabCardContent(foreignWord: "Ingat po", englishWord: "Goodbye"),
                LearnTagalogModel.VocabCardContent(foreignWord: "Kamusta po kayo?", englishWord: "How are you?"),
                LearnTagalogModel.VocabCardContent(foreignWord: "Mabuti po ako", englishWord: "I'm doing good"),
                LearnTagalogModel.VocabCardContent(foreignWord: "Magandang umaga po", englishWord: "Good morning"),
                LearnTagalogModel.VocabCardContent(foreignWord: "Magandang tanghali po", englishWord: "Good afternoon (noon)"),
                LearnTagalogModel.VocabCardContent(foreignWord: "Magandang hapon po", englishWord: "Good afternoon"),
                LearnTagalogModel.VocabCardContent(foreignWord: "Magandang gabi po", englishWord: "Good night")
                
            ],
            quiz: [
                LearnTagalogModel.QuizItem(
                    question: "What is an appropriate greeting for the morning time?",
                    answers: ["A. Magandang umaga po", "B. Magandang tanghali po", "C. Magandang hapon po", "D. Magandang gabi po"],
                    correctAnswer: "A. Magandang umaga po"
                ),
                LearnTagalogModel.QuizItem(
                    question: "How would you ask someone how they are doing?",
                    answers: ["A. Kamusta po kayo?", "B. Ingat po", "C. Mabuti po ako", "D. Magandang umaga po"],
                    correctAnswer: "A. Kamusta po kayo?"
                ),
                LearnTagalogModel.QuizItem(
                    question: "When should you use 'po'?",
                    answers: ["A. Never", "B. When talking to old people", "C. When talking to a friend", "D. Always"],
                    correctAnswer: "D. Always"
                )
            ]
        ),
        LearnTagalogModel.Topic(
            name: "Days of the Week",
            image: "calendar_picture",
            lessonText: """
            Days of the week are something taught in every language. \
            Once you know this, you can string some days of the week\
            with your greetings and farewells!
            """,
            vocab: [
                LearnTagalogModel.VocabCardContent(foreignWord: "Lunes", englishWord: "Monday"),
                LearnTagalogModel.VocabCardContent(foreignWord: "Martes", englishWord: "Tuesday"),
                LearnTagalogModel.VocabCardContent(foreignWord: "Miyerkules", englishWord: "Wednesday"),
                LearnTagalogModel.VocabCardContent(foreignWord: "Huwebes", englishWord: "Thursday"),
                LearnTagalogModel.VocabCardContent(foreignWord: "Biyernes", englishWord: "Friday"),
                LearnTagalogModel.VocabCardContent(foreignWord: "Sabado", englishWord: "Saturday"),
                LearnTagalogModel.VocabCardContent(foreignWord: "Linggo", englishWord: "Sunday")
            ],
            quiz: [
                LearnTagalogModel.QuizItem(
                    question: "What is Monday?",
                    answers: ["A. Lunes", "B. Martes", "C. Miyerkules", "D. Huwebes", "E. Biyernes", "F. Sabado", "G. Linggo"],
                    correctAnswer: "A. Lunes"
                ),
                LearnTagalogModel.QuizItem(
                    question: "What is Tuesday?",
                    answers: ["A. Lunes", "B. Martes", "C. Miyerkules", "D. Huwebes", "E. Biyernes", "F. Sabado", "G. Linggo"],
                    correctAnswer: "B. Martes"
                ),
                LearnTagalogModel.QuizItem(
                    question: "What is Wednesday?",
                    answers: ["A. Lunes", "B. Martes", "C. Miyerkules", "D. Huwebes", "E. Biyernes", "F. Sabado", "G. Linggo"],
                    correctAnswer: "C. Miyerkules"
                )
            ]
        ),
        LearnTagalogModel.Topic(
            name: "Numbers",
            image: "numbers_picture",
            lessonText: """
            One, two, three, four, I declare a thumb war. \
            Numbers are fun and great, but wouldn't they\
            be even better in another language? Learn those\
            digits everyone!
            """,
            vocab: [
                LearnTagalogModel.VocabCardContent(foreignWord: "Isa", englishWord: "One"),
                LearnTagalogModel.VocabCardContent(foreignWord: "Dalawa", englishWord: "Two"),
                LearnTagalogModel.VocabCardContent(foreignWord: "Tatlo", englishWord: "Three"),
                LearnTagalogModel.VocabCardContent(foreignWord: "Apat", englishWord: "Four"),
                LearnTagalogModel.VocabCardContent(foreignWord: "Lima", englishWord: "Five"),
                LearnTagalogModel.VocabCardContent(foreignWord: "Anim", englishWord: "Six"),
                LearnTagalogModel.VocabCardContent(foreignWord: "Pito", englishWord: "Seven"),
                LearnTagalogModel.VocabCardContent(foreignWord: "Walo", englishWord: "Eight"),
                LearnTagalogModel.VocabCardContent(foreignWord: "Siyam", englishWord: "Nine"),
                LearnTagalogModel.VocabCardContent(foreignWord: "Sampu", englishWord: "Ten")
            ],
            quiz: [
                LearnTagalogModel.QuizItem(
                    question: "Which answer shows the correct order of even numbers 1-10 from lowest to highest?",
                    answers: ["A. Siyam, Walo, Apat, Isa, Dalawa", "B. Sampu, Walo, Anim, Apat, Dalawa", "C. Dalawa, Apat, Anim, Walo, Sampu"],
                    correctAnswer: "C. Dalawa, Apat, Anim, Walo, Sampu"
                ),
                LearnTagalogModel.QuizItem(
                    question: "Which answer shows the correct order of odd numbers 1-10 from lowest to highest?",
                    answers: ["A. Siyam, Walo, Apat, Isa, Dalawa", "B. Isa, Tatlo, Lima, Pito, Siyam", "C. Dalawa, Apat, Anim, Walo, Sampu"],
                    correctAnswer: "B. Isa, Tatlo, Lima, Pito, Siyam"
                )
            ]
        ),
        LearnTagalogModel.Topic(
            name: "Colors",
            image: "color_picture",
            lessonText: """
            Colors of the colorwheel are important to describe\
            things to the nice people you meet in the Philippines. \
            Rainbows are always in the Philippines after rainstorms\
            which are extremely abundant during typhoon season!
            """,
            vocab: [
                LearnTagalogModel.VocabCardContent(foreignWord: "Pula", englishWord: "Red"),
                LearnTagalogModel.VocabCardContent(foreignWord: "Asul", englishWord: "Blue"),
                LearnTagalogModel.VocabCardContent(foreignWord: "Dilaw", englishWord: "Yellow"),
                LearnTagalogModel.VocabCardContent(foreignWord: "Berde", englishWord: "Green")
            ],
            quiz: [
                LearnTagalogModel.QuizItem(
                    question: "What is the color of healthy grass?",
                    answers: ["A. Pula", "B. Asul", "C. Dilaw", "D. Berde"],
                    correctAnswer: "D. Berde"
                ),
                LearnTagalogModel.QuizItem(
                    question: "What is the color of a ripe sunburn on a redhead?",
                    answers: ["A. Pula", "B. Asul", "C. Dilaw", "D. Berde"],
                    correctAnswer: "A. Pula"
                )
            ]
        )
    ]
}
