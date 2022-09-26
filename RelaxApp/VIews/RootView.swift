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
            VStack{
            switch statem.currentscreen {
            case .HomeScreen:
                VStack{
                    Header(title: "Tracks", backbuttonshown: false, settingsbuttonshown: true, helpbuttonshown: false)
                        .offset(x: 0, y: -40)
                    TrackListScrollView()
                    .background(Colorassets.mainback)
                    .onAppear(perform: {
                        Gyrostate.activateGyro()
                        globalstate.currentlist = debug.setuplist()
                    })
                    .onDisappear(perform: {
                        Gyrostate.deactivateGyro()
                    })
                    
                    .transition(.move(edge: .bottom))
                    
                    if statem.isplaying{
                        PlayBackBar(block: statem.currentPlayingItem)
                    }
                }
            case .DetailScreen:
                VStack{
                    Header(title: statem.currentDisplayedItem.noisetitle , backbuttonshown: true, settingsbuttonshown: false, helpbuttonshown: false)
                        .offset(x: 0, y: -40)
                SoundDetailView()
                    .transition(.move(edge: .bottom))
                    .background(Colorassets.mainback)
                    
                    Spacer()
                    if statem.isplaying{
                        PlayBackBar(block: statem.currentPlayingItem)
                    }
                    
                
                }
            case .Options:
                Header(title: statem.currentDisplayedItem.noisetitle , backbuttonshown: true, settingsbuttonshown: false, helpbuttonshown: false)
                    .offset(x: 0, y: -40)
                OptionsView()
            case .testcase:
                VStack {
                    Image(systemName: "circle.fill")
                    Button("return"){ globalstate.currentscreen = .HomeScreen }
                }
            case .BuilltinSounds:
                Header(title: statem.currentDisplayedItem.noisetitle , backbuttonshown: true, settingsbuttonshown: false, helpbuttonshown: false)
                    .offset(x: 0, y: -40)
                DebugView()
                
            case .Layerdsound:
                Header(title: statem.currentDisplayedItem.noisetitle , backbuttonshown: true, settingsbuttonshown: false, helpbuttonshown: true)
                    .offset(x: 0, y: -40)
                LayeredSoundView()
                    .background(Colorassets.mainback)
                    .transition(.move(edge: .bottom))
                if statem.isplaying{
                    PlayBackBar(block: statem.currentPlayingItem)
                }
                
            }
            }.onAppear(perform: {
                statem.setupRemoteTransportControls()
            }
            )
            .onChange(of: scenePhase) { newphase in
                if newphase == .background && UserDefaults.standard.bool(forKey: "stoponhide") == true {
                    statem.PrimaryPlayer.stop()
                }
            
            
        }.padding()
            .onAppear(perform: {statem.currentlist = debug.setuplist()})
            .background(Colorassets.mainback)
            
        }
        
        
        
        
    
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

