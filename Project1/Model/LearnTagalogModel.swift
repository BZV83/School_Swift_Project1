//
//  TempModel.swift
//  Project1
//
//  Created by Brendan Vick on 10/14/24.
//

import Foundation

protocol LessonPlan {
    var languageName: String { get }
    var topics: [LearnTagalogModel.Topic] { get }
    var progress: [LearnTagalogModel.Progress] { get set }
}

struct LearnTagalogModel {
    struct Topic: Identifiable {
        let id = UUID()
        let name: String
        let image: String
        let lessonText: String
        let vocab: [VocabTerm]
        let quiz: [QuizItem]
    }
    
    struct QuizItem {
        var question: String
        var answers: [String]?
        var correctAnswer: String
    }
    
    struct VocabTerm: Identifiable {
        let id = UUID()
        var foreignWord: String
        var englishWord: String
    }
    
    struct Progress {
        let topicID: UUID
        var lessonRead = false
        var vocabStudied = false
        var quizPassed = false
        var quizHighScore: Int?
    }
}

extension LearnTagalogModel.Progress: Identifiable {
    var id: UUID {
        topicID
    }
}

struct TagalogLessonPlan: LessonPlan {
    
    // MARK: - Read-only
    
    let languageName = "Tagalog"
    let topics = [
        LearnTagalogModel.Topic(
            name: "Greetings and Farewells",
            image: "hello_picture",
            lessonText: """
            Filipino people are very kind. A greeting can go a long way.\
            Here you can find many different greetings and farewells.\
            Always remember, if a word comes up you do not know, you\
            can never go wrong by adding a "po".
            """,
            vocab: [
                LearnTagalogModel.VocabTerm(foreignWord: "Kamusta", englishWord: "Hello"),
                LearnTagalogModel.VocabTerm(foreignWord: "Ingat po", englishWord: "Goodbye"),
                LearnTagalogModel.VocabTerm(foreignWord: "Kamusta po kayo?", englishWord: "How are you?"),
                LearnTagalogModel.VocabTerm(foreignWord: "Mabuti po ako", englishWord: "I'm doing good"),
                LearnTagalogModel.VocabTerm(foreignWord: "Magandang umaga po", englishWord: "Good morning"),
                LearnTagalogModel.VocabTerm(foreignWord: "Magandang tanghali po", englishWord: "Good afternoon (noon)"),
                LearnTagalogModel.VocabTerm(foreignWord: "Magandang hapon po", englishWord: "Good afternoon"),
                LearnTagalogModel.VocabTerm(foreignWord: "Magandang gabi po", englishWord: "Good night")
                
            ],
            quiz: [
                LearnTagalogModel.QuizItem(
                    question: "What is an appropriate greeting for the morning time?",
                    answers: ["Magandang umaga po", "Magandang tanghali po", "Magandang hapon po", "Magandang gabi po"],
                    correctAnswer: "Magaandang umaga po"
                ),
                LearnTagalogModel.QuizItem(
                    question: "How would you ask someone how they are doing?",
                    answers: ["Kamusta po kayo?", "Ingat po", "Mabuti po ako", "Magandang umaga po"],
                    correctAnswer: "Kamusta po kayo?"
                ),
                LearnTagalogModel.QuizItem(
                    question: "When should you use 'po'?",
                    answers: ["Never", "When talking to old people", "When talking to a friend", "Always"],
                    correctAnswer: "Always"
                )
            ]
        ),
        LearnTagalogModel.Topic(
            name: "Days of the Week",
            image: "calendar_picture",
            lessonText: """
            Days of the week are something taught in every language.\
            Once you know this, you can string some days of the week\
            with your greetings and farewells!
            """,
            vocab: [
                LearnTagalogModel.VocabTerm(foreignWord: "Lunes", englishWord: "Monday"),
                LearnTagalogModel.VocabTerm(foreignWord: "Martes", englishWord: "Tuesday"),
                LearnTagalogModel.VocabTerm(foreignWord: "Miyerkules", englishWord: "Wednesday"),
                LearnTagalogModel.VocabTerm(foreignWord: "Huwebes", englishWord: "Thursday"),
                LearnTagalogModel.VocabTerm(foreignWord: "Biyernes", englishWord: "Friday"),
                LearnTagalogModel.VocabTerm(foreignWord: "Sabado", englishWord: "Saturday"),
                LearnTagalogModel.VocabTerm(foreignWord: "Linggo", englishWord: "Sunday")
            ],
            quiz: [
                LearnTagalogModel.QuizItem(
                    question: "What is Monday?",
                    answers: ["Lunes", "Martes", "Miyerkules", "Huwebes", "Biyernes", "Sabado", "Linggo"],
                    correctAnswer: "Lunes"
                ),
                LearnTagalogModel.QuizItem(
                    question: "What is Tuesday?",
                    answers: ["Lunes", "Martes", "Miyerkules", "Huwebes", "Biyernes", "Sabado", "Linggo"],
                    correctAnswer: "Martes"
                ),
                LearnTagalogModel.QuizItem(
                    question: "What is Wednesday?",
                    answers: ["Lunes", "Martes", "Miyerkules", "Huwebes", "Biyernes", "Sabado", "Linggo"],
                    correctAnswer: "Miyerkules"
                )
            ]
        ),
        LearnTagalogModel.Topic(
            name: "Numbers",
            image: "numbers_picture",
            lessonText: """
            One, two, three, four, I declare a thumb war.\
            Numbers are fun and great, but wouldn't they\
            be even better in another language? Learn those\
            digits everyone!
            """,
            vocab: [
                LearnTagalogModel.VocabTerm(foreignWord: "Isa", englishWord: "One"),
                LearnTagalogModel.VocabTerm(foreignWord: "Dalawa", englishWord: "Two"),
                LearnTagalogModel.VocabTerm(foreignWord: "Tatlo", englishWord: "Three"),
                LearnTagalogModel.VocabTerm(foreignWord: "Apat", englishWord: "Four"),
                LearnTagalogModel.VocabTerm(foreignWord: "Lima", englishWord: "Five"),
                LearnTagalogModel.VocabTerm(foreignWord: "Anim", englishWord: "Six"),
                LearnTagalogModel.VocabTerm(foreignWord: "Pito", englishWord: "Seven"),
                LearnTagalogModel.VocabTerm(foreignWord: "Walo", englishWord: "Eight"),
                LearnTagalogModel.VocabTerm(foreignWord: "Siyam", englishWord: "Nine"),
                LearnTagalogModel.VocabTerm(foreignWord: "Sampu", englishWord: "Ten")
            ],
            quiz: [
                LearnTagalogModel.QuizItem(
                    question: "Which answer shows the correct order of even numbers 1-10 from lowest to highest?",
                    answers: ["Siyam, Walo, Apat, Isa, Dalawa", "Sampu, Walo, Anim, Apat, Dalawa", "Dalawa, Apat, Anim, Walo, Sampu"],
                    correctAnswer: "Dalawa, Apat, Anim, Walo, Sampu"
                ),
                LearnTagalogModel.QuizItem(
                    question: "Which answer shows the correct order of odd numbers 1-10 from lowest to highest?",
                    answers: ["Siyam, Walo, Apat, Isa, Dalawa", "Isa, Tatlo, Lima, Pito, Siyam", "Dalawa, Apat, Anim, Walo, Sampu"],
                    correctAnswer: "Isa, Tatlo, Lima, Pito, Siyam"
                )
            ]
        ),
        LearnTagalogModel.Topic(
            name: "Colors",
            image: "color_picture",
            lessonText: """
            Colors of the colorwheel are important to describe\
            things to the nice people you meet in the Philippines.\
            Rainbows are always in the Philippines after rainstorms\
            which are extremely abundant during typhoon season!
            """,
            vocab: [
                LearnTagalogModel.VocabTerm(foreignWord: "Pula", englishWord: "Red"),
                LearnTagalogModel.VocabTerm(foreignWord: "Asul", englishWord: "Blue"),
                LearnTagalogModel.VocabTerm(foreignWord: "Dilaw", englishWord: "Yellow"),
                LearnTagalogModel.VocabTerm(foreignWord: "Berde", englishWord: "Green")
            ],
            quiz: [
                LearnTagalogModel.QuizItem(
                    question: "What is the color of healthy grass?",
                    answers: ["Pula", "Asul", "Dilaw", "Berde"],
                    correctAnswer: "Berde"
                ),
                LearnTagalogModel.QuizItem(
                    question: "What is the color of a ripe sunburn on a redhead?",
                    answers: ["Pula", "Asul", "Dilaw", "Berde"],
                    correctAnswer: "Pula"
                )
            ]
        )
    ]
    
    // MARK: - Read-write Properties
    
    var progress: [LearnTagalogModel.Progress]
    
    // MARK: - Helpers
}
