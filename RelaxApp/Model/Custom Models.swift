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
    var sound: sounds
    var savedtime: Float
    
   
}

enum sounds : String {
    case payday
    case tada
    case generic
    case destiny
    case brown
}

