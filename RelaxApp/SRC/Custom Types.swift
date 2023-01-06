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

struct ScreenPage {
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
    var isButton:Bool
    var hasTransition:Bool
    var image:Image
    var text:String
    var ImageRef:String?
    var attachedScreenPage:ScreenPage?
    var additionalAction:()?
    var transitionAction:() -> Void
    ///Used to create HeaderButton Without a transition
    init(isButton: Bool, hasTransition: Bool, image: Image, text: String, ImageRef: String? = nil, attachedScreenPage: ScreenPage? = nil, additionalAction: ()? = nil) {
        self.isButton = isButton
        self.hasTransition = hasTransition
        self.image = image
        self.text = text
        self.ImageRef = ImageRef
        self.attachedScreenPage = attachedScreenPage
        self.additionalAction = additionalAction
        self.transitionAction = {}
        if attachedScreenPage != nil {
            self.transitionAction = {
            globalstate.currentHeader = attachedScreenPage!
                
            }
        }
       
    }
    init(isButton: Bool, hasTransition: Bool, image: Image, text: String, ImageRef: String? = nil, attachedScreenPage: ScreenPage? = nil, additionalAction: ()? = nil, transition: @escaping () -> Void) {
        self.isButton = isButton
        self.hasTransition = hasTransition
        self.image = image
        self.text = text
        self.ImageRef = ImageRef
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





    
    
    

