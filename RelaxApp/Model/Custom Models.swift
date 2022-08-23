//
//  Custom Models.swift
//  RelaxApp
//
//  Created by william Vise on 16/8/2022.
//

import Foundation
import SwiftUI

struct MenuBlocks {
    var backcolor: Color
    var noisetitle:String
    var descripton:String
    var duration:Int
    var image:Image?
    var id: UUID
    var sound: AvailableSounds
    var savedtime: Float
    
   
}

enum AvailableSounds : String, CaseIterable {
    case brown
    case white
    case rain
    case fire
   
}

enum CurrentScreen {
    case HomeScreen
    case DetailScreen
    case Debug
    case Options
    case testcase
}


