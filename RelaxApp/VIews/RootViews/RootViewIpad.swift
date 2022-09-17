//
//  RootViewIpad.swift
//  RelaxApp
//
//  Created by william Vise on 17/9/2022.
//

import SwiftUI

struct RootViewIpad: View {
    @Environment(\.scenePhase) var scenePhase
    @StateObject var statem = globalstate
    var body: some View {
        ZStack {
            VStack{
            switch statem.currentscreen {
            case .HomeScreen:
                VStack{
                TrackListView()
                    .background(Colorassets.mainback)
                    .onAppear(perform: {
                        Gyrostate.activateGyro()
                    })
                    .onDisappear(perform: {
                        Gyrostate.deactivateGyro()
                    })
                    
                    if statem.isplaying{
                        PlayBackBar(block: statem.currentPlayingItem)
                    }
                }
            case .DetailScreen:
                VStack{
                DetailPage()
                    .background(Colorassets.mainback)
                    .transition(.move(edge: .bottom))
                    Spacer()
                    if statem.isplaying{
                        PlayBackBar(block: statem.currentPlayingItem)
                    }
                
                }
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
            }
            )
            
            
        }.onChange(of: scenePhase) { newphase in
            if newphase == .background && UserDefaults.standard.bool(forKey: "stoponhide") == true {
                statem.sharedplayer.stop()
            }
            
        }
        .padding()
        .ignoresSafeArea()
        .background(Colorassets.mainback)
        
        
        
    }
}

struct RootViewIpad_Previews: PreviewProvider {
    static var previews: some View {
        RootViewIpad()
    }
}
