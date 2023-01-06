//
//  AudioHandler.swift
//  RelaxApp
//
//  Created by william Vise on 16/8/2022.
//

import Foundation

import UIKit
import AVKit


class AudioHandler {
    private var player: AVAudioPlayer!
    func SetAudio(fileSelected:AvailableSounds) -> AVAudioPlayer {
        
        
        guard let fileurl = Bundle.main.url(
            forResource: setString(selectedFile: fileSelected),
          withExtension: ".mp3") ?? URL(string: "") else { return player }
        do{
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
             player = try AVAudioPlayer(contentsOf: fileurl)
            
                return player
        } catch {
            print(error)
            
        }
        
        return player
        
        
        
        
    }
    
   
        
    func CreateBackgroundPlayer(sounds: [AvailableSounds]) -> [AVAudioPlayer] {
            var list = [AVAudioPlayer]()
            
            do{
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
                for x in sounds {
                    guard let fileurl = Bundle.main.url(
                        forResource: setString(selectedFile: x),
                      withExtension: ".mp3") ?? URL(string: "") else { return list }
                    player = try AVAudioPlayer(contentsOf: fileurl)
                    player.volume = 1
                    list.append(player)
                }
                 
                
                    return list
            } catch {
                print(error)
                
            }
            
            return [player]
            
            
            
            
        }
    
    
    func setString(selectedFile: AvailableSounds) -> String {
        switch selectedFile {
        case .brown:
            return "Brown"
        case .white:
            return "White"
        case .rain:
            return "Rain"
        case .fire:
            return "Fire"
        case .debug:
            return "Debug"
        
        }
    }
    
    
}

