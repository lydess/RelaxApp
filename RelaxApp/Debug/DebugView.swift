//
//  DebugView.swift
//  RelaxApp
//
//  Created by william Vise on 19/8/2022.
//

import SwiftUI

struct DebugView: View {
    @StateObject var  statem = globalstate
    @State var anim = false
    @State var slide = 0.0
    
 
    let defaults = UserDefaults.standard
    
    var body: some View {
       VStack {
           EmptyView()
           
        }
        
    }
}

struct DebugView_Previews: PreviewProvider {
    static var previews: some View {
        DebugView()
    }
}
