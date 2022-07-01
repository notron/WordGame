//
//  GameHandler.swift
//  WordGame
//
//  Created by Mahdi on 7/1/22.
//

import Foundation

class GameHandler {
    
    static let shared = GameHandler()
    private var words = [Word]()
    
    private init() {
        words = LoadWordsFromJsonFile()
    }
    
    func SetUpNewGame() -> MainGame {
        
        return MainGame(CreateWordPairs())
    }
    
    private func CreateWordPairs() -> [WordPair] {
        
        // list of word objecs form local json file
        var currentWords = words
        var wordPairs = [WordPair]()
        
        while currentWords.count > 2 {
            let CreateCorrectWordOrNot = Bool.random()
            if CreateCorrectWordOrNot {
                
                let randomWord = currentWords.remove(at: Int.random(in: 0..<currentWords.count-1))
                wordPairs.append(WordPair(randomWord.EnglishText, randomWord.SpanishText, true))
            } else {
                let randomWord = currentWords.remove(at: Int.random(in: 0..<currentWords.count-1))
                let secondRandomWord = currentWords.remove(at: Int.random(in: 0..<currentWords.count-1))
                wordPairs.append(WordPair(randomWord.EnglishText, secondRandomWord.SpanishText, false))
            }
        }
        return wordPairs
    }
    
    private func LoadWordsFromJsonFile() -> [Word] {
        //Extraction list of word objects form local json file
        if let path = Bundle.main.path(forResource: "words", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let words = try JSONDecoder().decode([Word].self, from: data)
                return words
                
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            print("Invalid filename/path.")
        }
        
        return []
    }
}
