//
//  ContentView.swift
//  RelaxApp
//
//  Created by william Vise on 15/8/2022.
//

import SwiftUI


let Gyro = GyroManager()
let Audio = AudioHandler()
let RDB = DataBaseHandler()

// Globalstate is always last, it relies on methods from above to properly initalise the initial user state
let globalstate = StateManager()

struct RootView: View {
    @Environment(\.scenePhase) var scenePhase
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @StateObject var statem = globalstate
    var debug = BuiltinSounds()
    
    var body: some View {
        VStack(spacing: 0){
                Header()
                    .frame(width: UIScreen.main.bounds.width, height: 75, alignment: .center)
                    
                    Spacer()
            switch statem.currentHeader.ScreenType {
            case .HomeScreen:
                VStack{
                    if horizontalSizeClass == .regular {
                        TrackListScrollView().frame(width: UIScreen.main.bounds.width - 100)
                    } else {
                        TrackListScrollView()
                            .transition(.move(edge: .leading))
                            .onAppear(perform: {
                                Gyro.activateGyro()
                                globalstate.currentlist = debug.setuplist()
                            })
                            .onDisappear(perform: {
                                Gyro.deactivateGyro()
                            })
                        
                        if statem.isplaying{
                            PlayBackBar(block: statem.currentPlayingItem)
                        }
                        
                    }
                }
            case .DetailScreen:
                VStack{

                SoundDetailView()
                    .transition(.move(edge: .leading))
                    .background(ColorAssets.mainback)
                    
                    Spacer()
                    if statem.isplaying{
                        PlayBackBar(block: statem.currentPlayingItem)
                    }
                    
                
                }
            case .Options:

                OptionsView()
                    .transition(.move(edge: .leading))
                    
                
            case .DebugView:
                DebugView()
            case .BuilltinSounds:

                
                DebugView()
                
            case .Layerdsound:
                LayeredSoundView()
                    .background(ColorAssets.mainback)
                    .transition(.move(edge: .leading))
                if statem.isplaying{
                    PlayBackBar(block: statem.currentPlayingItem)
                        .background(ColorAssets.mainback)
                }
                if horizontalSizeClass == .compact {Rectangle().frame(width: UIScreen.main.bounds.width, height: 50)
                    .foregroundColor(ColorAssets.mainback)}
                
                
                
            }
            }.onAppear(perform: {
                statem.setupRemoteTransportControls()
            }
            )
            .onChange(of: scenePhase) { newphase in
                if newphase == .background && UserDefaults.standard.bool(forKey: "stoponhide") == true {
                    statem.PrimaryPlayer.pause()
                }
            
            
        }
            .onAppear(perform: {
                statem.currentlist = debug.setuplist()
                globalstate.handleInitialLaunch()
            })
            .background(ColorAssets.mainback)
            
    }
        
        
        
        
    
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

