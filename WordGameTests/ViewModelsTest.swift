//
//  ViewModelsTest.swift
//  WordGameTests
//
//  Created by Mahdi on 7/3/22.
//

import XCTest
@testable import WordGame

class ViewModelsTest: XCTestCase {
    
    var wordPair1 : WordPair!
    var wordPair2 : WordPair!
    var wordPair3 : WordPair!
    var wordPair4 : WordPair!

    override func setUp() {
        
        wordPair1 = WordPair("primary school", "escuela primaria", true)
        wordPair1.isUserAnswerCorrectly = true
        wordPair2 = WordPair("teacher", "alumno", false)
        wordPair2.isUserAnswerCorrectly = true
        wordPair3 = WordPair("holidays", "vacaciones", true)
        wordPair3.isUserAnswerCorrectly = false
        wordPair4 = WordPair("bell", "grupo", false)
        wordPair4.isUserAnswerCorrectly = false
    }
    
    
    func test_wordPairViewModel_with_sample_wordPair_model() {
        
        let wordPairVM1 = WordPairViewModel(wordPair1)
        let wordPairVM2 = WordPairViewModel(wordPair2)
        let wordPairVM3 = WordPairViewModel(wordPair3)
        let wordPairVM4 = WordPairViewModel(wordPair4)
        
        XCTAssertEqual(wordPairVM1.englishText, "primary school")
        XCTAssertEqual(wordPairVM1.spanishText, "escuela primaria")
        XCTAssertEqual(wordPairVM1.expectedResult, "Correct")
        XCTAssertEqual(wordPairVM1.viewColor, .green)
        
        XCTAssertEqual(wordPairVM2.englishText, "teacher")
        XCTAssertEqual(wordPairVM2.spanishText, "alumno")
        XCTAssertEqual(wordPairVM2.expectedResult, "Wrong")
        XCTAssertEqual(wordPairVM2.viewColor, .green)
        
        XCTAssertEqual(wordPairVM3.englishText, "holidays")
        XCTAssertEqual(wordPairVM3.spanishText, "vacaciones")
        XCTAssertEqual(wordPairVM3.expectedResult, "Correct")
        XCTAssertEqual(wordPairVM3.viewColor, .red)
        
        XCTAssertEqual(wordPairVM4.englishText, "bell")
        XCTAssertEqual(wordPairVM4.spanishText, "grupo")
        XCTAssertEqual(wordPairVM4.expectedResult, "Wrong")
        XCTAssertEqual(wordPairVM4.viewColor, .red)
    }

}
