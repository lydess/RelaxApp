//
//  ContentView.swift
//  RelaxApp
//
//  Created by william Vise on 15/8/2022.
//

import SwiftUI

let globalstate = StateManager()
let Gyrostate = GyroManager()

struct RootView: View {
   
    
    
    @StateObject var statem = globalstate
    var debug = Debug()
    
    
    var body: some View {
        ZStack {
            VStack{
            switch statem.currentscreen {
            case .HomeScreen:
                HomeView()
                    .background(Colorassets.mainback)
                    .onAppear(perform: {
                        Gyrostate.activateGyro()
                    })
                    .onDisappear(perform: {
                        Gyrostate.deactivateGyro()
                        print("not seeing")
                    })
            case .DetailScreen:
                DetailPage()
                    .background(Colorassets.mainback)
                    .transition(.move(edge: .bottom))
            case .Options:
                OptionsView()
            case .testcase:
                VStack {
                    Image(systemName: "circle.fill")
                    Button("return"){ globalstate.currentscreen = .HomeScreen }
                }
            case .Debug:
                DebugView()
            }
                
                
            
            }.onAppear(perform: {
                
                statem.setupRemoteTransportControls()
                
        })
            VStack{
                Spacer()
                
            if statem.isplaying{
                PlayBackBar(player: nil, block: statem.currentPlayingItem)
                    
                    
                
            }
        }
        }
        
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

