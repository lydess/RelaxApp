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
    @State var animationAmount = 4
    @State var boxW = CGFloat(0)
    @State var boxH = CGFloat(0)
 
    let defaults = UserDefaults.standard
    
    var body: some View {
       VStack {
           Button("get me outa here!"){statem.currentscreen = .HomeScreen}
            Text("Bugs, Bugs everywhere!")
           Spacer()
           Button("push to reset defaults"){
               defaults.set(false, forKey: "firstlaunch")
               print(defaults.bool(forKey: "firstlaunch"))
           }
           Spacer()
           
           Rectangle()
               .frame(width: 100, height: 100 , alignment: .center).foregroundColor(.green)
               .padding(.leading, 300)
               
               
               
        
           
           Spacer()
        }
        
    }
}

struct DebugView_Previews: PreviewProvider {
    static var previews: some View {
        DebugView()
    }
}
