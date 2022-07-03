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
    
    private let game = MainGame()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
        game.setUpNewGame()
        game.startGame(delegate: self)
    }
    
    @IBAction func correctAction(_ sender: Any) {
        SoundHandler.shared.playSound(.click)
        game.attemptAction(true)
    }
    
    @IBAction func wrongAction(_ sender: Any) {
        SoundHandler.shared.playSound(.click)
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
    
    func returnNewWordPair(_ wordPairViewModel: WordPairViewModel) {
        
        englishWordLabel.text = wordPairViewModel.englishText
        spanishWordLabel.text = wordPairViewModel.spanishText
        resetMobileViewAnimation()
    }
    
    func updateState(_ stateViewModel: StateViewModel) {
        correctAttemptLabel.text = stateViewModel.correctAttempts
        wrongAttemptLabel.text = stateViewModel.wrongAttempts
    }
    
    func gameFinished() {
        let view = ResultViewController(game.getResult(), self)
        self.presentCross(view)
    }
}
