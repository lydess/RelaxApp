//
//  RootViewCore.swift
//  RelaxApp
//
//  Created by william Vise on 17/9/2022.
//

import SwiftUI
let globalstate = StateManager()
let Gyrostate = GyroManager()


struct RootViewCore: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    var body: some View {
        Button("printclass"){
            print("Horizontal \(horizontalSizeClass)")
            print("Vertical\(verticalSizeClass)")
        }
    }
}

struct RootViewCore_Previews: PreviewProvider {
    static var previews: some View {
        RootViewCore()
    }
}
