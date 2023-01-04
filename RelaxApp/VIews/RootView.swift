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
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @StateObject var statem = globalstate
    var debug = BuiltinSounds()
    
    var body: some View {
            VStack{
                Header()
                    .frame(width: UIScreen.main.bounds.width, height: 100, alignment: .bottom)
                    .background(.red)
                    
            switch statem.currentscreen {
            case .HomeScreen:
                VStack{
                    
                    TrackListScrollView()
                    
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

                SoundDetailView()
                    .transition(.move(edge: .bottom))
                    .background(Colorassets.mainback)
                    
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
                    .background(Colorassets.mainback)
                    .transition(.move(edge: .bottom))
                if statem.isplaying{
                    PlayBackBar(block: statem.currentPlayingItem)
                        .background(Colorassets.mainback)
                }
                if horizontalSizeClass == .compact {Rectangle().frame(width: UIScreen.main.bounds.width, height: 50)
                    .foregroundColor(Colorassets.mainback)}
                
                
                
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

