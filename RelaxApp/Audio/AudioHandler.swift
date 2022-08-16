//
//  AudioHandler.swift
//  RelaxApp
//
//  Created by william Vise on 16/8/2022.
//

import Foundation
import AVFAudio

class AudioHandler {
    var filepath = URL(fileURLWithPath: "/Users/williamvise/Documents/xcode/RelaxApp/RelaxApp/Debug/mp3file.mp3")
    func debugplayer() {
        do{
            var player = try AVAudioPlayer(contentsOf: filepath)
            
            player.play()
        }catch{
            print("Error occoured " + error.localizedDescription)
        }
        
    }
    
}

