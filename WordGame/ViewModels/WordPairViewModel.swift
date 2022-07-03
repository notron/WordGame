//
//  WordPairViewModel.swift
//  WordGame
//
//  Created by Mahdi on 7/1/22.
//

import Foundation
import UIKit

struct WordPairViewModel {
    
    var englishText: String
    var spanishText: String
    
    var expectedResult: String
    var viewColor: UIColor
    
    init(_ wordPair: WordPair) {
        
        englishText = wordPair.englishWord
        spanishText = wordPair.spanishWord
        
        if wordPair.isTranslationCorrect {
            expectedResult = "Correct"
        } else {
            expectedResult = "Wrong"
        }
        
        if wordPair.isUserAnswerCorrectly ?? false {
            viewColor = .green
        } else {
            viewColor = .red
        }
    }
    
}
