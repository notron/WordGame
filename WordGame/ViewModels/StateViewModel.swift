//
//  StateViewModel.swift
//  WordGame
//
//  Created by Mahdi on 7/1/22.
//

import Foundation

struct StateViewModel {
    
    var correctAttempts: String
    var wrongAttempts: String
    
    init(_ correctAttempts: Int, _ wrongAttempts: Int) {
        
        self.correctAttempts = String(correctAttempts)
        self.wrongAttempts = String(wrongAttempts)
    }
}


