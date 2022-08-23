//
//  StateManager.swift
//  RelaxApp
//
//  Created by william Vise on 16/8/2022.
//

import Foundation
import AVKit
import MediaPlayer
class StateManager: ObservableObject {
    static let shared = StateManager()
    @Published var sharedplayer = AVAudioPlayer()
    @Published var currentDisplayedItem = MenuBlocks(backcolor: .red, noisetitle: "Debug", descripton: "Descbug", duration: 60, id: UUID(), sound: .brown, savedtime: 0.0)
    @Published var currentPlayingItem = MenuBlocks(backcolor: .red, noisetitle: "Debugplaying", descripton: "Descbug playing", duration: 60, id: UUID(), sound: .white, savedtime: 0.0)
    @Published var currentlist = [MenuBlocks]()
    @Published var currentscreen = CurrentScreen.HomeScreen
    @Published var musicstatus = 0.0
    @Published var isplaying = false
    @Published var showpage = 0
    
     func setupRemoteTransportControls() {
        // Get the shared MPRemoteCommandCenter
        let commandCenter = MPRemoteCommandCenter.shared()

        // Add handler for Play Command
        commandCenter.playCommand.addTarget { [unowned self] event in
            self.sharedplayer.play()
            self.isplaying = true
            return .success
        }
        
        

        // Add handler for Pause Command
        commandCenter.pauseCommand.addTarget { [unowned self] event in
            self.sharedplayer.pause()
            self.isplaying = false
            return .success
        }
        
    }
    func UpdateNowPlaying(block: MenuBlocks) {
        // Define Now Playing Info
        var nowPlayingInfo = [String : Any]()
        nowPlayingInfo[MPMediaItemPropertyTitle] = globalstate.currentPlayingItem.noisetitle

        if let image = UIImage(named: setString(selectedFile: globalstate.currentDisplayedItem.sound)) {
            nowPlayingInfo[MPMediaItemPropertyArtwork] =
                MPMediaItemArtwork(boundsSize: image.size) { size in
                    return image
            }
        }
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
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
        
        }
    
    }
    
    func defaultsConfigCheck() -> Bool {
        let testcase = UserDefaults.standard.string(forKey: "checkconfig")
        if testcase == nil {
            return false
        }
        return true
        
    }
}
