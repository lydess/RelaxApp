//
//  Debug.swift
//  RelaxApp
//
//  Created by william Vise on 15/8/2022.
//

import Foundation
import SwiftUI

class Debug{
func setuplist() -> [MenuBlocks] {
        var corelist = [MenuBlocks]()
    corelist.append(MenuBlocks(     backcolor: Colorassets.platinum,
                                    noisetitle: "Brown Noise",
                                    descripton: "Deeper form of white noise, known to be helpful for people with ADD or Autism in assisting focus",
                                    duration: 60,
                                    image: Image(uiImage: UIImage(named: "Brown")!),
                                    id: UUID(),
                                    sound: .brown,
                                    savedtime: 0.0
                                    ))
    corelist.append(MenuBlocks(backcolor: Colorassets.silver,
                                    noisetitle: "White Noise",
                                    descripton: "Static sound which can neutralise intrusive thoughts",
                                    duration: 40,
                                    image: Image(uiImage: UIImage(named: "White")!),
                                    id: UUID(),
                                    sound: .white,
                                    savedtime: 0.0))
    corelist.append(MenuBlocks(backcolor: Colorassets.bleu,
                                    noisetitle: "Rainfall",
                                    descripton: "Sounds of rain falling in an open field, calming sense of renewal",
                                    duration: 40,
                                    image: Image(uiImage: UIImage(named: "Rain")!),
                                    id: UUID(),
                                    sound: .rain,
                                    savedtime: 0.0))
    corelist.append(MenuBlocks(backcolor: Colorassets.red,
                                    noisetitle: "Campfire",
                                    descripton: "Sound of a campfire crackling in the night",
                                    duration: 40,
                                    image: Image(uiImage: UIImage(named: "Fire")!),
                                    id: UUID(),
                                    sound: .fire,
                                    savedtime: 0.0))

        return corelist
    }
}
