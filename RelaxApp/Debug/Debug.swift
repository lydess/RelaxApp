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
                                    descripton: "Great for people with ADD or on the spectrum",
                                    duration: 60,
                                    image: Image(uiImage: UIImage(named: "Brown")!),
                                    id: UUID(),
                                    sound: .brown,
                                    savedtime: 0.0
                                    ))
    corelist.append(MenuBlocks(backcolor: Colorassets.silver,
                                    noisetitle: "White Noise",
                                    descripton: "More racey version for white people",
                                    duration: 40,
                                    image: Image(uiImage: UIImage(named: "White")!),
                                    id: UUID(),
                                    sound: .white,
                                    savedtime: 0.0))
    corelist.append(MenuBlocks(backcolor: Colorassets.silver,
                                    noisetitle: "Rainfall",
                                    descripton: "Sounds of rain falling in an open field",
                                    duration: 40,
                                    image: Image(uiImage: UIImage(named: "Rain")!),
                                    id: UUID(),
                                    sound: .rain,
                                    savedtime: 0.0))
    corelist.append(MenuBlocks(backcolor: Colorassets.silver,
                                    noisetitle: "Fire",
                                    descripton: "Sound of a campfire crackling in the night",
                                    duration: 40,
                                    image: Image(uiImage: UIImage(named: "Fire")!),
                                    id: UUID(),
                                    sound: .fire,
                                    savedtime: 0.0))

        return corelist
    }
}
