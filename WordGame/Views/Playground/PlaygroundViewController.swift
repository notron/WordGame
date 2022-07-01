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
    @IBOutlet weak var mobileWordView: UIView!
    @IBOutlet weak var mobileWordYPosition: NSLayoutConstraint!
    
    private let game: MainGame
    
    init(_ game: MainGame) {
        self.game = game
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
        game.startGame(delegate: self)
    }
    
    @IBAction func correctAction(_ sender: Any) {
        MusicPlayer.shared.playButtonSound()
        game.attemptAction(true)
    }
    
    @IBAction func wrongAction(_ sender: Any) {
        MusicPlayer.shared.playButtonSound()
        game.attemptAction(false)
    }
    
    func resetMobileViewAnimation() {
        
        UIView.animate(withDuration: 0.2, delay: 0.0, animations: {
            self.mobileWordYPosition.constant = 300
            self.view.layoutIfNeeded()
        })
        
        UIView.animate(withDuration: 4.8, delay: 0.2, animations: {
            self.mobileWordYPosition.constant = 0
            self.view.layoutIfNeeded()
        })
    }
}

extension PlaygroundViewController: mainGameDelegate {
    
    func returnNewWordPair(_ wordPair: WordPair) {
        
        englishWordLabel.text = wordPair.EnglishWord
        spanishWordLabel.text = wordPair.SpanishWord
        resetMobileViewAnimation()
    }
    
    func updateState(_ correctAttempts: Int, _ wrongAttempts: Int) {
        correctAttemptLabel.text = "\(correctAttempts)"
        wrongAttemptLabel.text = "\(wrongAttempts)"
    }
}
