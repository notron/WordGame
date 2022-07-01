//
//  Word.swift
//  WordGame
//
//  Created by Mahdi on 7/1/22.
//

import Foundation

struct Word : Decodable {
    
    var EnglishText : String
    var SpanishText : String
    
    enum CodingKeys: String, CodingKey {
        
        case EnglishText = "text_eng"
        case SpanishText = "text_spa"
    }
}
