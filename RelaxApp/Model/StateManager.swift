//
//  StateManager.swift
//  RelaxApp
//
//  Created by william Vise on 16/8/2022.
//

import Foundation

class StateManager: ObservableObject {
    static let shared = StateManager()
    @Published var currentitem = MenuBlocks(backcolor: .red, noisetitle: "Debug", descripton: "Descbug", duration: 60, id: UUID())
    @Published var currentlist = [MenuBlocks]()
    @Published var currentscreen = 0
    
}
