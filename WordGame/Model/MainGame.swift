//
//  MainGame.swift
//  WordGame
//
//  Created by Mahdi on 7/1/22.
//

import Foundation

protocol mainGameDelegate {
    func returnNewWordPair(_ wordPair: WordPair)
    func updateState(_ correctAttempts: Int, _ wrongAttempts: Int)
}

class MainGame {
    
    private var delegate : mainGameDelegate?
    
    private var remainedWordPairs = [WordPair]()
    private var usedWordPairs = [WordPair]()
    private var currentWordPair : WordPair?
    private var correctAttempts = 0
    private var wrongAttempts = 0
    private var totalPairsSeen = 0
    private var timer : Timer?
    
    init(_ wordPairs: [WordPair]) {
        remainedWordPairs = wordPairs
    }
    
    func startGame(delegate: mainGameDelegate) {
        self.delegate = delegate
        returnNewWordPair()
    }
    
    private func returnNewWordPair() {
        currentWordPair = remainedWordPairs.removeFirst()
        totalPairsSeen += 1
        delegate?.returnNewWordPair(currentWordPair!)
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { [weak self] (timer) in
            
            self?.currentWordPair?.isUserAnswerCorrectly = false
            self?.wrongAttempts += 1
            self?.updateState()
        }
    }
    
    func attemptAction(_ isCorrect: Bool) {
        
        if currentWordPair?.isTranslationCorrect == isCorrect {
            currentWordPair?.isUserAnswerCorrectly = true
            correctAttempts += 1
        } else {
            currentWordPair?.isUserAnswerCorrectly = false
            wrongAttempts += 1
        }
        updateState()
    }
    
    private func updateState() {
        delegate?.updateState(correctAttempts, wrongAttempts)
        
        if wrongAttempts < 10 && totalPairsSeen < 15 {
            returnNewWordPair()
        } else {
            timer?.invalidate()
            timer = nil
        }
    }
}
