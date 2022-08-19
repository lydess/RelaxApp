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
        ZStack{
        switch statem.currentscreen {
        case 0:
            HomeView()
        case 1:
            DetailPage(block: statem.currentDisplayedItem)
        default:
            EmptyView()
        }
            if statem.isplaying{PlayBackBar(player: nil, block: statem.currentPlayingItem)}
            
        
        }
        
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

