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

    static func AttachScreensToButtons() {
        for x in CurrentScreen.allCases {
            
            let Transition_Home = HeaderItem(Type: .Button, Position: .Left, image: Image(systemName: "chevron.left"), transition: { globalstate.currentHeader = HomeView} )
            let Transition_Options = HeaderItem(Type: .Button, Position: .Right, image: Image(systemName: "gearshape.fill"), transition: { globalstate.currentHeader = OptionsView} )
            var PageTitle = HeaderItem(Type: .StaticTitle, Position: .Middle)
            var TrackTitle = HeaderItem(Type: .TrackTitle, Position: .Middle)
            
            
            var HeadersToAdd = [HeaderItem]()
            do {
                switch x {
                    
                case .HomeScreen:
                    PageTitle.text = "Tracks"
                    HeadersToAdd = try BuildHeaderBar(middle: PageTitle, right: Transition_Options, Apperance: .Equidistant)
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
                case .testcase:
                    break
                case .Layerdsound:
                    PageTitle.text = "Sound"
                    HeadersToAdd.append(contentsOf: [
                        PageTitle,
                        Transition_Home
                    ])
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
                if count ==  1 {OrderedButtons.append(FillerItem)} else { OrderedButtons.append(x) }
                count += 1
            }
            
           
        case .AvoidRight:
            for x in UnOrderedButtons {
                count += 1
                if count ==  3 {OrderedButtons.append(FillerItem)} else { OrderedButtons.append(x) }
                
            }
        case .AvoidLeft:
            for x in UnOrderedButtons {
                if count ==  0 {OrderedButtons.append(FillerItem)} else { OrderedButtons.append(x) }
                count += 1
            }
            
        }
        count = 0
        return OrderedButtons
    }
    

}
