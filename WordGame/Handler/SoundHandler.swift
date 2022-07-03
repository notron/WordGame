//
//  SoundHandler.swift
//  WordGame
//
//  Created by Mahdi Moayeri on 5/9/20.
//  Copyright © 2020 Mahdi Moayeri. All rights reserved.
//

import AVFoundation

class SoundHandler {
    
    public static let shared = SoundHandler()
    private init() {}
    
    public var isMute = false
    private var buttonPlayer: AVAudioPlayer?
    
    func playSound(_ type: SoundType) {
        
        guard let url = Bundle.main.url(forResource: type.rawValue, withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .spokenAudio)
            try AVAudioSession.sharedInstance().setActive(true)

            buttonPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let buttonPlayer = buttonPlayer else { return }
            buttonPlayer.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
}

