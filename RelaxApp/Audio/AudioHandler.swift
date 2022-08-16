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
    var player: AVAudioPlayer!
   

    
    
    func Play() -> AVAudioPlayer {
        
        guard let fileurl = Bundle.main.url(
          forResource: "mp3file",
          withExtension: "mp3") ?? URL(string: "") else { return player }
        do{
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
             player = try AVAudioPlayer(contentsOf: fileurl)
                return player
            
            print("play")
        }catch{
            print(error)
            print("balls")
        }
        
        return player
        
        
        
        
    }
    
}

