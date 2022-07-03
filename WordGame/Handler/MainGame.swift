//
//  MainGame.swift
//  WordGame
//
//  Created by Mahdi on 7/1/22.
//

import Foundation

protocol mainGameDelegate {
    func returnNewWordPair(_ wordPairViewModel: WordPairViewModel)
    func updateState(_ stateViewModel: StateViewModel)
    func gameFinished()
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
    
    func setUpNewGame() {
        
        remainedWordPairs = GameHandler.shared.SetUpNewGame()
        usedWordPairs = []
        correctAttempts = 0
        wrongAttempts = 0
        totalPairsSeen = 0
    }
    
    func startGame(delegate: mainGameDelegate) {
        self.delegate = delegate
        returnNewWordPair()
        delegate.updateState(StateViewModel(correctAttempts, wrongAttempts))
    }
    
    private func returnNewWordPair() {
        currentWordPair = remainedWordPairs.removeFirst()
        totalPairsSeen += 1
        delegate?.returnNewWordPair(WordPairViewModel(currentWordPair!))
        
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
        usedWordPairs.append(currentWordPair!)
        updateState()
    }
    
    private func updateState() {
        delegate?.updateState(StateViewModel(correctAttempts, wrongAttempts))
        if wrongAttempts < 3 && totalPairsSeen < 15 {
            returnNewWordPair()
        } else {
            timer?.invalidate()
            timer = nil
            delegate?.gameFinished()
        }
    }
    
    func getResult() -> ResultViewModel {
        
        let wordPairViewModels = usedWordPairs.map({ WordPairViewModel($0)})
        return ResultViewModel(wordPairViewModels)
    }
}
