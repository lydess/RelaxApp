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
   

    
    
    func SetAudio(fileSelected:sounds) -> AVAudioPlayer {
        
        
        guard let fileurl = Bundle.main.url(
          forResource: setfile(selectedFile: fileSelected),
          withExtension: "mp3") ?? URL(string: "") else { return player }
        do{
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
             player = try AVAudioPlayer(contentsOf: fileurl)
                return player
        }catch{
            print(error)
            
        }
        
        return player
        
        
        
        
    }
    
    func setfile(selectedFile: sounds) -> String {
        switch selectedFile {
        case .payday:
            return "Payday"
        case .tada:
            return "Tada-sound"
        case .generic:
            return "mp3file"
        }
        
        return "Failure"
        
    }
    
}

