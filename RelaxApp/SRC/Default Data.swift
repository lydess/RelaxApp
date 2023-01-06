//
//  Default Data.swift
//  RelaxApp
//
//  Created by william Vise on 6/1/2023.
//

import Foundation
import SwiftUI
class ColorAssets {
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



class ScreenPages {
    static var shared = ScreenPages()
    static var HomeView = ScreenPage(ScreenType: .HomeScreen)
    static var DetailView = ScreenPage(ScreenType: .DetailScreen)
    static var OptionsView = ScreenPage(ScreenType: .Options)
    static var LayeredSoundView = ScreenPage(ScreenType: .Layerdsound)

    static func AttachScreensToButtons() {
        for x in CurrentScreen.allCases {

            let Transition_Home = HeaderItem(isButton: true, hasTransition: true, image: Image(systemName: "chevron.backward.circle"), text: "", transition: { globalstate.currentHeader = HomeView} )
            let Transition_Options = HeaderItem(isButton: true, hasTransition: true, image: Image(systemName: "gearshape.fill"), text: "", transition: { globalstate.currentHeader = OptionsView} )
            //let Transition_Detail = HeaderItem(isButton: true, hasTransition: true, image: Image(systemName: ""), text: "", transition: { globalstate.currentHeader = DetailView} )
            var Title = HeaderItem(isButton: false, hasTransition: false, image: Image(systemName: ""), text: "Hello world")
            
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
    

}
