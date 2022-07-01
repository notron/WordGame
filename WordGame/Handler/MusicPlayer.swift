//
//  MusicPlayer.swift
//  Pantomime
//
//  Created by Mahdi Moayeri on 5/9/20.
//  Copyright © 2020 Mahdi Moayeri. All rights reserved.
//

import AVFoundation

class MusicPlayer {
    
    public static let shared = MusicPlayer()
    private init() {}
    
    public var isMute = false
    private var buttonPlayer: AVAudioPlayer?
    
    func playButtonSound() {
        
        guard let url = Bundle.main.url(forResource: "click", withExtension: "wav") else { return }
        
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
    
    func playClockSound() {
        
        guard let url = Bundle.main.url(forResource: "clock", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.soloAmbient, mode: .spokenAudio)
            try AVAudioSession.sharedInstance().setActive(true)

            buttonPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let buttonPlayer = buttonPlayer else { return }
            buttonPlayer.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func playFinishSound() {
        
        guard let url = Bundle.main.url(forResource: "finish", withExtension: "mp3") else { return }
        
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
    
    func playKidsSound() {
        
        guard let url = Bundle.main.url(forResource: "kids", withExtension: "mp3") else { return }
        
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

