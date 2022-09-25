//
//  ContentView.swift
//  RelaxApp
//
//  Created by william Vise on 15/8/2022.
//

import SwiftUI


let Gyrostate = GyroManager()
let audiohandle = AudioHandler()
let globalstate = StateManager()
struct RootView: View {
    @Environment(\.scenePhase) var scenePhase
    @StateObject var statem = globalstate
    var debug = BuiltinSounds()
    
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
                        globalstate.currentlist = debug.setuplist()
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
                SoundDetailView()
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
            case .BuilltinSounds:
                DebugView()
            case .Layerdsound:
                LayeredSoundView()
                
            }
            }.onAppear(perform: {
                statem.setupRemoteTransportControls()
            }
            )
            
            
        }.onChange(of: scenePhase) { newphase in
            if newphase == .background && UserDefaults.standard.bool(forKey: "stoponhide") == true {
                statem.PrimaryPlayer.stop()
            }
            
        }
        .padding()
        .ignoresSafeArea()
        .background(Colorassets.mainback)
        
        
        
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

