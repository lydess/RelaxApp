//
//  Default Data.swift
//  RelaxApp
//
//  Created by william Vise on 6/1/2023.
//

import Foundation
import SwiftUI

class ColorAssets {
    static let silver = Color(uiColor: UIColor(named: "Silver") ?? .systemPink)
    static let mainback = Color(uiColor: UIColor(named: "Rootback") ?? .systemPink)
    static let playbar = Color(uiColor: UIColor(named: "Playbar") ?? .systemPink)
    static let platinum = Color(uiColor: UIColor(named: "Platinum") ?? .systemPink)
    static let pink = Color(uiColor: UIColor(named: "Pink") ?? .systemPink)
    static let red = Color(uiColor: UIColor(named: "Red") ?? .systemPink)
    static let bleu = Color(uiColor: UIColor(named: "Bleu") ?? .systemPink)
    static let gear = Color(uiColor: UIColor(named: "gearcolor") ?? .systemPink)
    static let black = Color(uiColor: UIColor(named: "Black") ?? .systemPink)
    static let header = Color(uiColor: UIColor(named: "Header") ?? .systemPink)
    static let green = Color(uiColor: UIColor(named: "green") ?? .systemPink)
    static let textbleu = Color(uiColor: UIColor(named: "TextBleu") ?? .systemPink)
}



class ScreenPages {
    
    static var shared = ScreenPages()
    static var HomeView = ScreenPage(ScreenType: .HomeScreen)
    static var DetailView = ScreenPage(ScreenType: .DetailScreen)
    static var OptionsView = ScreenPage(ScreenType: .Options)
    static var LayeredSoundView = ScreenPage(ScreenType: .Layerdsound)
    static var DebugView = ScreenPage(ScreenType: .DebugView)
    static var Fillerheader = HeaderItem(Type: .Filler, Position: .Unknown, image: Image(systemName: ""), transition: {})
    private var chev = Image(systemName: "chevron.left")
    static func AttachScreensToButtons() {
        
        for x in CurrentScreen.allCases {
            
            let Transition_Home = HeaderItem(Type: .Transition, Position: .Left, image: Image(systemName: "chevron.left"), transition: { globalstate.currentHeader = HomeView} )
            let Transition_Options = HeaderItem(Type: .Transition, Position: .Right, image: Image(systemName: "gearshape.fill"), transition: { globalstate.currentHeader = OptionsView} )
            let Alert_LayerdSound = HeaderItem(Type: .Alert, Position: .Right, image: Image(systemName: "questionmark.circle"), transition: {Alert(title: Text("Create your own sound"), message: Text("Using the Buttons below, tap to add a sound and create your own Mix"), dismissButton: .cancel())})
            var PageTitle = HeaderItem(Type: .StaticTitle, Position: .Middle)
            var TrackTitle = HeaderItem(Type: .TrackTitle, Position: .Middle)
            
            
            var HeadersToAdd = [HeaderItem]()
            do {
                switch x {
                    
                case .HomeScreen:
                    PageTitle.text = "Tracks"
                    HeadersToAdd = try BuildHeaderBar(middle: PageTitle, right: Transition_Options, Apperance: .AvoidLeft)
                    HomeView.HeaderDetails = HeadersToAdd
                case .DetailScreen:
                    PageTitle.text = "TrackName"
                    HeadersToAdd = try BuildHeaderBar(left: Transition_Home ,middle: TrackTitle, right: Transition_Options, Apperance: .Equidistant)
                    DetailView.HeaderDetails = HeadersToAdd
                case .BuilltinSounds:
                    break
                case .Options:
                    PageTitle.text = "Options"
                    HeadersToAdd = try BuildHeaderBar(left: Transition_Home, middle: PageTitle,  Apperance: .AvoidRight)
                    OptionsView.HeaderDetails = HeadersToAdd
                case .DebugView:
                    PageTitle.text = "Debug"
                    HeadersToAdd = try BuildHeaderBar(left: Transition_Home, middle: PageTitle,Apperance: .Equidistant)
                    DebugView.HeaderDetails = HeadersToAdd
                    break
                case .Layerdsound:
                    PageTitle.text = "Sound"
                    HeadersToAdd = try BuildHeaderBar(left: Transition_Home, middle: PageTitle,right: Alert_LayerdSound, Apperance: .Equidistant)
                    LayeredSoundView.HeaderDetails = HeadersToAdd
                }
                
            }
            catch {
                print("aweful failure \(error)")
            }
        }
        
        
    }
    
    static func BuildHeaderBar(left:HeaderItem? = nil, middle:HeaderItem? = nil, right:HeaderItem? = nil, Apperance:HeaderSetup) throws -> [HeaderItem] {

        var UnOrderedButtons  = [HeaderItem]()
        var OrderedButtons = [HeaderItem]()
        var FillerItem = HeaderItem(Type: .Filler, Position: .Unknown, image: Image(systemName: ""), transition: {})
        var count = 0
        if let Leftside = left { UnOrderedButtons.append(Leftside) }
        if let Middleside = middle { UnOrderedButtons.append(Middleside) }
        if let Rightside = right { UnOrderedButtons.append(Rightside) }
    
        switch Apperance {
            
        case .Equidistant:
            OrderedButtons = UnOrderedButtons
        case .AvoidMiddle:
            
            for x in UnOrderedButtons {
                count += 1
                if count ==  2 {OrderedButtons.append(FillerItem)}
                OrderedButtons.append(x)

            }
        case .AvoidRight:
            OrderedButtons = UnOrderedButtons
            OrderedButtons.append(FillerItem)
        case .AvoidLeft:
            for x in UnOrderedButtons {
                count += 1
                if count ==  1 {OrderedButtons.append(FillerItem)}
                OrderedButtons.append(x) 

                
            }
            
        }
        count = 0
        return OrderedButtons
    }
    

}
