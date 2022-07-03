//
//  WordPair.swift
//  WordGame
//
//  Created by Mahdi on 7/1/22.
//

import Foundation

struct WordPair {
    
    var englishWord: String
    var spanishWord: String
    
    var isTranslationCorrect: Bool
    var isUserAnswerCorrectly: Bool?
    
    init(_ EnglishWord: String, _ SpanishWord: String, _ isTranslationCorrect: Bool) {
    
        self.englishWord = EnglishWord
        self.spanishWord = SpanishWord
        self.isTranslationCorrect = isTranslationCorrect
        self.isUserAnswerCorrectly = nil
    }
}
