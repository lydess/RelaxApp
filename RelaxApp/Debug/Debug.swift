//
//  Debug.swift
//  RelaxApp
//
//  Created by william Vise on 15/8/2022.
//

import Foundation

class Debug{
func setuplist() -> [NoiseBlocks] {
        var corelist = [NoiseBlocks]()
        corelist.append(NoiseBlocks(backcolor: .mint,
                                    noisetitle: "Brown Noise",
                                    descripton: "Great for people with ADD or on the spectrum",
                                    duration: 60))
        corelist.append(NoiseBlocks(backcolor: .cyan,
                                    noisetitle: "White Noise",
                                    descripton: "More racey version for white people",
                                    duration: 40))
        return corelist
    }
}
