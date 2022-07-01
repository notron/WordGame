//
//  PreGameViewController.swift
//  WordGame
//
//  Created by Mahdi on 7/1/22.
//

import UIKit

class PreGameViewController: UIViewController {
    
    let gameHandler = GameHandler.shared

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func StartAction(_ sender: Any) {
        
        let view = PlaygroundViewController(gameHandler.SetUpNewGame())
        self.present(view, animated: true)
    }

}