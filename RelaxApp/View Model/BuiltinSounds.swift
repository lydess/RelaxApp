//
//  Debug.swift
//  RelaxApp
//
//  Created by william Vise on 15/8/2022.
//

import Foundation
import SwiftUI

class BuiltinSounds{
    static var shared = BuiltinSounds()
func setuplist() -> [SoundItem] {
        var corelist = [SoundItem]()

    corelist.append(SoundItem(     backcolor: Colorassets.platinum,
                                    noisetitle: "Brown Noise",
                                    descripton: "Deeper form of white noise, known to be helpful for people with ADD or Autism in assisting focus",
                                    image: Image(uiImage: UIImage(named: "Brown")!),
                                    id: UUID(),
                                    fontsize: 18,
                                    sound: .brown,
                                    islayeredsound: false
                                    
                                    ))
    corelist.append(SoundItem(backcolor: Colorassets.silver,
                                    noisetitle: "White Noise",
                                    descripton: "Static sound which can neutralise intrusive thoughts",
                                    image: Image(uiImage: UIImage(named: "White")!),
                                    id: UUID(),
                                    fontsize: 18,
                                    sound: .white,
                                    islayeredsound: false
                                   ))
    corelist.append(SoundItem(backcolor: Colorassets.bleu,
                                    noisetitle: "Rainfall",
                                    descripton: "Sounds of rain falling in an open field, calming sense of renewal",
                                    image: Image(uiImage: UIImage(named: "Rain")!),
                                    id: UUID(),
                                    fontsize: 18,
                                    sound: .rain,
                                    islayeredsound: false
                                    ))
    corelist.append(SoundItem(backcolor: Colorassets.red,
                                    noisetitle: "Campfire",
                                    descripton: "Sound of a campfire crackling in the night",
                                    image: Image(uiImage: UIImage(named: "Fire")!),
                                    id: UUID(),
                                    fontsize: 18,
                                    sound: .fire,
                                    islayeredsound: false
                                   ))
   
    corelist.append(SoundItem(backcolor: Colorassets.silver,
                                    noisetitle: "Make Your Own",
                                    descripton: "Use the buttons to build your own sound",
                                    image: Image(uiImage: UIImage(named: "Custom")!),
                                    id: UUID(),
                                    fontsize: 18,
                                    sound: .fire,
                                    islayeredsound: true,
                                layeredsounds: [
                                    Layeredsound(sound: .rain, image: Image(systemName: "cloud.rain"), player: audiohandle.SetAudio(fileSelected: .rain), name: "Rain"),
                                    Layeredsound(sound: .brown, image: Image(systemName: "waveform.path.ecg"), player: audiohandle.SetAudio(fileSelected: .brown), name: "Brown Noise"),
                                    Layeredsound(sound: .brown, image: Image(systemName: "waveform.path.ecg"), player: audiohandle.SetAudio(fileSelected: .white), name: "White Noise"),
                                    Layeredsound(sound: .brown, image: Image(systemName: "flame"), player: audiohandle.SetAudio(fileSelected: .fire), name: "Fire")]
                                   ))
    
    corelist.append(SoundItem(backcolor: Colorassets.silver,
                                    noisetitle: "Advanced",
                                    descripton: "lets get weird",
                                    image: Image(uiImage: UIImage(named: "Debug")!),
                                    id: UUID(),
                                    fontsize: 18,
                                    sound: .fire,
                                    islayeredsound: true,
                                layeredsounds: [
                                    Layeredsound(sound: .rain, image: Image(systemName: "cloud.rain"), player: audiohandle.SetAudio(fileSelected: .rain), name: "Rain"),
                                    Layeredsound(sound: .brown, image: Image(systemName: "waveform.path.ecg"), player: audiohandle.SetAudio(fileSelected: .brown), name: "Brown Noise"),
                                    Layeredsound(sound: .brown, image: Image(systemName: "waveform.path.ecg"), player: audiohandle.SetAudio(fileSelected: .white), name: "White Noise"),
                                    Layeredsound(sound: .brown, image: Image(systemName: "flame"), player: audiohandle.SetAudio(fileSelected: .fire), name: "Fire")]
                                   ))


        return corelist
    }
}
