//
//  StateManager.swift
//  RelaxApp
//
//  Created by william Vise on 16/8/2022.
//

import Foundation
import AVKit

class StateManager: ObservableObject {
    static let shared = StateManager()
    @Published var sharedplayer = AVAudioPlayer()
    @Published var currentDisplayedItem = MenuBlocks(backcolor: .red, noisetitle: "Debug", descripton: "Descbug", duration: 60, id: UUID(), sound: .tada, savedtime: 0.0)
    @Published var currentPlayingItem = MenuBlocks(backcolor: .red, noisetitle: "Debugplaying", descripton: "Descbug playing", duration: 60, id: UUID(), sound: .tada, savedtime: 0.0)
    @Published var currentlist = [MenuBlocks]()
    @Published var currentscreen = 0
    @Published var musicstatus = 0.0
    @Published var isplaying = false
    
}
