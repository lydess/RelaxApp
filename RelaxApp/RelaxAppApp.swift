//
//  RelaxAppApp.swift
//  RelaxApp
//
//  Created by william Vise on 15/8/2022.
//

import SwiftUI

@main
struct RelaxAppApp: App {
    @StateObject var statem = StateManager()
    var debug = Debug()
    var body: some Scene {
        WindowGroup {
            //TODO: REMOVE DEBUG LIST MENTIONED BELOW
            RootView()
        }
    }
}
