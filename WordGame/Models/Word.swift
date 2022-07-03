//
//  Word.swift
//  WordGame
//
//  Created by Mahdi on 7/1/22.
//

import Foundation

struct Word : Decodable {
    
    var englishText : String
    var spanishText : String
    
    enum CodingKeys: String, CodingKey {
        
        case englishText = "text_eng"
        case spanishText = "text_spa"
    }
}
