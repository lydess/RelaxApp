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
}



class ScreenPages {
    static var shared = ScreenPages()
    static var HomeView = ScreenPage(ScreenType: .HomeScreen)
    static var DetailView = ScreenPage(ScreenType: .DetailScreen)
    static var OptionsView = ScreenPage(ScreenType: .Options)
    static var LayeredSoundView = ScreenPage(ScreenType: .Layerdsound)

    static func AttachScreensToButtons() {
        for x in CurrentScreen.allCases {

            let Transition_Home = HeaderItem(Type: .Button, Position: .Right, image: Image(systemName: "chevron.left"), transition: { globalstate.currentHeader = HomeView} )
            let Transition_Options = HeaderItem(Type: .Button, Position: .Left, image: Image(systemName: "gearshape.fill"), transition: { globalstate.currentHeader = OptionsView} )
            var Title = HeaderItem(Type: .Title, Position: .Middle)
            
            var HeadersToAdd = [HeaderItem]()
            switch x {
            
            case .HomeScreen:
                Title.text = "Tracks"
                HeadersToAdd.append(contentsOf: [
                Title,
                Transition_Options
                ])
                HomeView.HeaderDetails = HeadersToAdd
            case .DetailScreen:
                Title.text = "TrackName"
                HeadersToAdd.append(contentsOf: [
                Title,
                Transition_Home,
                ])
                DetailView.HeaderDetails = HeadersToAdd
            case .BuilltinSounds:
                break
            case .Options:
                Title.text = "Options"
                HeadersToAdd.append(contentsOf: [
                Transition_Home,
                Title,
                ])
                OptionsView.HeaderDetails = HeadersToAdd
            case .testcase:
                break
            case .Layerdsound:
                Title.text = "Sound"
                HeadersToAdd.append(contentsOf: [
                Title,
                Transition_Home
                ])
                LayeredSoundView.HeaderDetails = HeadersToAdd
            }
            
        }
        
        
    }
    
    func BuildHeaderBar(left:HeaderItem?, middle:HeaderItem?, right:HeaderItem?, Apperance:HeaderSetup) throws -> [HeaderItem] {
        var HeaderButtons  = [HeaderItem]()
        var FillerItem = HeaderItem(Type: .Filler, Position: .Unknown, image: Image(systemName: ""), transition: {})
        
        if let Leftside = left { HeaderButtons.append(Leftside) }
        if let Middleside = middle { HeaderButtons.append(Middleside) }
        if let Rightside = right { HeaderButtons.append(Rightside) }
        
        switch Apperance {
            
        case .Equidistant:
            break
        case .AvoidMiddle:
            HeaderButtons[2] = HeaderButtons[1]
            HeaderButtons.insert(FillerItem, at: 1 )
        case .AvoidRight:
            HeaderButtons.append(FillerItem)
        case .AvoidLeft:
            HeaderButtons[2] = HeaderButtons[1]
            HeaderButtons[1] = HeaderButtons[0]
            HeaderButtons.insert(FillerItem, at: 0)
        }
        
        return HeaderButtons
    }
    

}
