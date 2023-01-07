//
//  Custom Models.swift
//  RelaxApp
//
//  Created by william Vise on 16/8/2022.
// new comment

import Foundation
import SwiftUI
import AVKit
struct SoundItem {
    var backcolor: Color
    var noisetitle:String
    var descripton:String
    var image:Image?
    var id: UUID
    var fontsize: Int
    var sound: AvailableSounds
    var islayeredsound: Bool
    var layeredsounds = [Layeredsound]()
}

enum AvailableSounds : String, CaseIterable {
    case brown
    case white
    case rain
    case fire
    case debug
}

enum AvailableBackgroundSounds : String, CaseIterable {
    case car
}

enum CurrentScreen:CaseIterable {
    case HomeScreen
    case DetailScreen
    case BuilltinSounds
    case Options
    case testcase
    case Layerdsound
}

enum HeaderItemType {
    case Button
    case Title
    case Filler
}

enum HeaderPosition {
    case Left
    case Middle
    case Right
    case Unknown
}

enum HeaderSetup {
    case Equidistant
    case AvoidMiddle
    case AvoidRight
    case AvoidLeft
}

enum UIerrors: Error {
    case HeaderSetupFailure
}
struct ScreenPage: Identifiable {
    var id = UUID()
    let ScreenType:CurrentScreen
    var HeaderDetails:[HeaderItem]?
    
    init(ScreenType: CurrentScreen, HeaderDetails: [HeaderItem]) {
        self.ScreenType = ScreenType
        self.HeaderDetails = HeaderDetails
    }
    init(ScreenType: CurrentScreen) {
        self.ScreenType = ScreenType
        self.HeaderDetails = nil
    }
}
struct HeaderItem: Identifiable{
    var id = UUID()
    var HeaderType:HeaderItemType
    var HeaderPosition:HeaderPosition
    var image:Image
    var text:String?
    var attachedScreenPage:ScreenPage?
    var additionalAction:()?
    var transitionAction:() -> Void
    ///Used to create HeaderButton Without a transition
    init(Type:HeaderItemType, Position:HeaderPosition, text:String? = nil, attachedScreenPage: ScreenPage? = nil, additionalAction: ()? = nil) {
        self.HeaderType = Type
        self.HeaderPosition = Position
        self.image = Image(systemName: "")
        self.text = text
        self.attachedScreenPage = attachedScreenPage
        self.additionalAction = additionalAction
        self.transitionAction = {}
        if attachedScreenPage != nil {
            self.transitionAction = {
            globalstate.currentHeader = attachedScreenPage!
            }
        }
    }
    init(Type:HeaderItemType, Position:HeaderPosition ,image: Image, text:String? = nil, attachedScreenPage: ScreenPage? = nil, additionalAction: ()? = nil, transition: @escaping () -> Void) {
        self.HeaderType = Type
        self.HeaderPosition = Position
        self.image = image
        self.text = text
        self.attachedScreenPage = attachedScreenPage
        self.additionalAction = additionalAction
        self.transitionAction = {transition()}
    }
}

struct Layeredsound: Equatable, Hashable {
    var id = UUID()
    var sound: AvailableSounds
    var image: Image
    var player: AVAudioPlayer
    var name: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    
    
}





    
    
    

