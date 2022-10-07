//
//  StateManager.swift
//  RelaxApp
//
//  Created by william Vise on 16/8/2022.
//

import Foundation
import AVKit
import MediaPlayer
import SwiftUI

class StateManager: ObservableObject {
    @Published var PrimaryPlayer = AVAudioPlayer()
    @Published var BackgroundPlayers = [Layeredsound]()
    @Published var currentDisplayedItem = SoundItem(backcolor: .red, noisetitle: "Debug", descripton: "Descbug",image: Image(uiImage: UIImage(named: "Brown") ?? UIImage(systemName: "circle")!), id: UUID(), fontsize: 18, sound: .brown, islayeredsound: false)
    @Published var currentPlayingItem = SoundItem(backcolor: .red, noisetitle: "Debug", descripton: "Descbug",image: Image(uiImage: UIImage(named: "Brown") ?? UIImage(systemName: "circle")!), id: UUID(), fontsize: 18, sound: .brown, islayeredsound: false)
    @Published var currentlist = BuiltinSounds.shared.setuplist()
    @Published var currentscreen = CurrentScreen.HomeScreen
    @Published var musicstatus = 0.0
    @Published var isplaying = false
    @Published var ispaused = false
    @Published var showpage = 0
    @Published var cellcount = 0
    @Published var activemixers = [MixerButton]()
    
    
    
    
     func setupRemoteTransportControls() {
        let commandCenter = MPRemoteCommandCenter.shared()
        commandCenter.playCommand.addTarget { [unowned self] event in
            self.PrimaryPlayer.play()
            self.isplaying = true
            return .success
        }
        commandCenter.pauseCommand.addTarget { [unowned self] event in
            self.PrimaryPlayer.pause()
            self.isplaying = false
            return .success
        }
    }
    func UpdateNowPlaying(block: SoundItem) {
        // Define Now Playing Info
        var nowPlayingInfo = [String : Any]()
        if globalstate.currentPlayingItem.noisetitle == "Make Your Own" {
            nowPlayingInfo[MPMediaItemPropertyTitle] = "Your sound"
        } else {
            nowPlayingInfo[MPMediaItemPropertyTitle] = globalstate.currentPlayingItem.noisetitle
        }
        

        if let image = UIImage(named: setString(selectedFile: globalstate.currentDisplayedItem.sound)) {
            nowPlayingInfo[MPMediaItemPropertyArtwork] =
                MPMediaItemArtwork(boundsSize: image.size) { size in
                    return image
            }
        }
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
    }
    
    
    func defaultsConfigCheck() -> Bool {
        let testcase = UserDefaults.standard.string(forKey: "checkconfig")
        if testcase == nil {
            return false
        }
        return true
    }
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
