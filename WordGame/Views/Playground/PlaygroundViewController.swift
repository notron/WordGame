//
//  PlaygroundViewController.swift
//  WordGame
//
//  Created by Mahdi on 7/1/22.
//

import UIKit

class PlaygroundViewController: UIViewController {
    
    @IBOutlet weak var correctAttemptLabel: UILabel!
    @IBOutlet weak var wrongAttemptLabel: UILabel!
    @IBOutlet weak var englishWordLabel: UILabel!
    @IBOutlet weak var spanishWordLabel: UILabel!
    
    private let game: MainGame
    
    init(_ game: MainGame) {
        self.game = game
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game.startGame(delegate: self)
    }
    
    @IBAction func correctAction(_ sender: Any) {
        game.attemptAction(true)
    }
    
    @IBAction func wrongAction(_ sender: Any) {
        game.attemptAction(false)
    }
}

extension PlaygroundViewController: mainGameDelegate {
    
    func returnNewWordPair(_ wordPair: WordPair) {
        
        englishWordLabel.text = wordPair.EnglishWord
        spanishWordLabel.text = wordPair.SpanishWord
    }
    
    func updateState(_ correctAttempts: Int, _ wrongAttempts: Int) {
        correctAttemptLabel.text = "\(correctAttempts)"
        wrongAttemptLabel.text = "\(wrongAttempts)"
    }
}
