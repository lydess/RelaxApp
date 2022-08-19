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
        corelist.append(MenuBlocks(backcolor: .mint,
                                    noisetitle: "Brown Noise",
                                    descripton: "Great for people with ADD or on the spectrum",
                                    duration: 60,
                                    image: Image(uiImage: UIImage(named: "Brown")!),
                                    id: UUID(),
                                   sound: .brown,
                                   savedtime: 0.0
                                    ))
        corelist.append(MenuBlocks(backcolor: .cyan,
                                    noisetitle: "White Noise",
                                    descripton: "More racey version for white people",
                                    duration: 40,
                                    image: Image(uiImage: UIImage(named: "Brown")!),
                                    id: UUID(),
                                   sound: .white,
                                   savedtime: 0.0))
        return corelist
    }
}
