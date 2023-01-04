//
//  Custom Models.swift
//  RelaxApp
//
//  Created by william Vise on 16/8/2022.
//

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

enum CurrentScreen {
    case HomeScreen
    case DetailScreen
    case BuilltinSounds
    case Options
    case testcase
    case Layerdsound
}

class Colorassets {
    static let silver = Color(uiColor: UIColor(named: "Silver") ?? .gray)
    static let mainback = Color(uiColor: UIColor(named: "Rootback") ?? .white)
    static let playbar = Color(uiColor: UIColor(named: "Playbar") ?? .purple)
    static let platinum = Color(uiColor: UIColor(named: "Platinum") ?? .brown)
    static let pink = Color(uiColor: UIColor(named: "Pink") ?? .brown)
    static let red = Color(uiColor: UIColor(named: "Red") ?? .blue)
    static let bleu = Color(uiColor: UIColor(named: "Bleu") ?? .blue)
    static let gear = Color(uiColor: UIColor(named: "gearcolor") ?? .gray)
    static let black = Color(uiColor: UIColor(named: "Black") ?? .brown)
    static let header = Color(uiColor: UIColor(named: "Header") ?? .blue)
    static let green = Color(uiColor: UIColor(named: "green") ?? .green)
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

class builtinStructs {
    public var buttons:[HeaderButton]
    init(Statecontext:StateManager) {
        var buttonlist = [HeaderButton]()
        let BacktoHomebutton = HeaderButton(image: Image(systemName: "chevron.left"), buttonsize: 44, StateContext: Statecontext, NewScreen: .HomeScreen, action: nil)
        let Settings = HeaderButton(image: Image(systemName: "gearshape.circle"), buttonsize: 44, StateContext: Statecontext, NewScreen: .Options, action: nil)
        let Slider = HeaderButton(image: Image(systemName: ""), action: {}, buttonsize: 44)
        
    }
}

struct HeaderButton:View {
    private var image:Image
    private var action:() -> Void?
    private var buttonsize:CGFloat
    private var StateContext:StateManager?
    private var NewScreen:CurrentScreen?
    var me = ["1"]
    
    var body: some View {
        
        Button(action: {action()}, label: {image})
            .frame(width: buttonsize, height: buttonsize, alignment: .center)
    }
    /// non-transition button
    init(image: Image, action: @escaping () -> Void, buttonsize: CGFloat) {
        me.last
        self.image = image
        self.action = action
        self.buttonsize = buttonsize
    }
    /// button that provides a transition between views without an action
    init(image: Image, buttonsize: CGFloat, StateContext:StateManager, NewScreen:CurrentScreen) {
        self.image = image
        self.buttonsize = buttonsize
        self.StateContext = StateContext
        self.NewScreen = NewScreen
        self.action = {
            StateContext.currentscreen = NewScreen }
        
    }
    /// button that provides a transition between views with an action
    init(image: Image, buttonsize: CGFloat, StateContext:StateManager, NewScreen:CurrentScreen, action: Void? ) {
        self.image = image
        self.buttonsize = buttonsize
        self.StateContext = StateContext
        self.NewScreen = NewScreen
        self.action = {
            action
            StateContext.currentscreen = NewScreen }
        
    }
    
    
}

    
    
    

