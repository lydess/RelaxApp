//
//  ContentView.swift
//  RelaxApp
//
//  Created by william Vise on 15/8/2022.
//

import SwiftUI


struct RootView: View {
    @StateObject var statem = StateManager()
    var debug = Debug()
    
    var body: some View {
        switch statem.currentscreen {
        case 0:
            HomeView()
        case 1:
            DetailPage(block: statem.currentnoiseblock)
        default:
            EmptyView()
        }
        
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

