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
        ZStack{
            
        
        NavigationView{
        ScrollView{
            ForEach(statem.example, id: \.id){ block in
                NavigationLink(destination: {Text("batman")}, label: {NoiseBlock(backcolor: block.backcolor, noisetitle: block.noisetitle, descripton: block.descripton, duration: block.duration)}).buttonStyle(.plain)
                
                
                
                
            }
        
            
        }.background(
            LinearGradient(gradient: Gradient(colors: [.orange,.red]), startPoint: .topLeading, endPoint: .bottomTrailing)
        
        )
        }
            VStack {
                Text("You will be Okay")
                    .onAppear(perform: {statem.example = debug.setuplist()})
                    .padding()
                Spacer()
            }
            
        
        
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

