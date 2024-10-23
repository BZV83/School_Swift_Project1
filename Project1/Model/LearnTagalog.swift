//
//  TempModel.swift
//  Project1
//
//  Created by Brendan Vick on 10/14/24.
//

import Foundation

struct LearnTagalog {    
    struct Topic: Identifiable {
        let id = UUID()
        var name: String
        var image: String
        //var lessonText: String
        //VocabularyList: VocabTerms
        //var quiz: QuizItem
        //var progress: PersistentProgress
    }
    
    struct QuizItem {
        var question: String
        var answers: [String]?
        var correctAnswer: String
    }
    
    struct VocabTerms {
        var foreignWord: String
        var englishWord: String
    }
    //questions, answers, lesson content
}
