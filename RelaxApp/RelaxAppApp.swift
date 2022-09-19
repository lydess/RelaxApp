//
//  RelaxAppApp.swift
//  RelaxApp
//
//  Created by william Vise on 15/8/2022.
//

import SwiftUI

@main
struct RelaxAppApp: App {
    @StateObject var statem = globalstate
    
    var debug = Debug()
    var body: some Scene {
        WindowGroup {
            RootView()
                .background(Colorassets.mainback)
                
        }
    }
}
