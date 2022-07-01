//
//  WordPair.swift
//  WordGame
//
//  Created by Mahdi on 7/1/22.
//

import Foundation

struct WordPair {
    
    var EnglishWord: String
    var SpanishWord: String
    
    let isTranslationCorrect: Bool
    var isUserAnswerCorrectly: Bool?
    
    init(_ EnglishWord: String, _ SpanishWord: String, _ isTranslationCorrect: Bool) {
    
        self.EnglishWord = EnglishWord
        self.SpanishWord = SpanishWord
        self.isTranslationCorrect = isTranslationCorrect
        self.isUserAnswerCorrectly = false
    }
}
