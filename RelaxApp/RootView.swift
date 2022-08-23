//
//  ContentView.swift
//  RelaxApp
//
//  Created by william Vise on 15/8/2022.
//

import SwiftUI

let globalstate = StateManager()

struct RootView: View {
   
    
    
    @StateObject var statem = globalstate
    var debug = Debug()
    
    
    var body: some View {
        ZStack {
            VStack{
            switch statem.currentscreen {
            case 0:
                HomeView()
                    .background(Colorassets.mainback)
                    
            case 1:
                DetailPage(block: statem.currentDisplayedItem)
                    .transition(.move(edge: .bottom))
                    .background(Colorassets.mainback)
                    
                    
            case 2:
                OptionsView()
            case 100:
                DebugView()
            default:
                EmptyView()
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

