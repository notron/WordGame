//
//  ResultTableViewCell.swift
//  WordGame
//
//  Created by Mahdi on 7/1/22.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    
    static let key = "ResultTableViewCell"
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var englishLabel: UILabel!
    @IBOutlet weak var spanishLabel: UILabel!
    @IBOutlet weak var expectedLabel: UILabel!
    
    func config(_ wordPairViewModel: WordPairViewModel) {
        
        parentView.backgroundColor = wordPairViewModel.viewColor
        englishLabel.text = wordPairViewModel.englishText
        spanishLabel.text = wordPairViewModel.spanishText
        expectedLabel.text = wordPairViewModel.expectedResult
    }
}
