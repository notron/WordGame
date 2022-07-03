//
//  ResultViewModel.swift
//  WordGame
//
//  Created by Mahdi on 7/1/22.
//

import Foundation

struct ResultViewModel {
    
    private let wordPairViewModels : [WordPairViewModel]
    
    init(_ wordPairViewModels: [WordPairViewModel]) {
        self.wordPairViewModels = wordPairViewModels
    }
    
    func getCount() -> Int {
        return wordPairViewModels.count
    }
    
    func getWordPairViewModel(_ index: Int) -> WordPairViewModel {
        return wordPairViewModels[index]
    }
    
}
