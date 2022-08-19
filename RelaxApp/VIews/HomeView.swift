//
//  HomeView.swift
//  RelaxApp
//
//  Created by william Vise on 16/8/2022.
//

import SwiftUI

struct HomeView: View {
    @StateObject var State = globalstate
    var debug = Debug()
    var body: some View {
        VStack {
            Text("Sounds").onAppear(perform: {State.currentlist = debug.setuplist()})
            ScrollView{
                ForEach(State.currentlist, id: \.id){ block in
                    Button(action: {
                        State.currentDisplayedItem = MenuBlocks(backcolor: block.backcolor,
                                                                noisetitle: block.noisetitle,
                                                                descripton: block.descripton,
                                                                duration: 6,
                                                                image: block.image,
                                                                id: UUID(),
                                                                sound: block.sound,
                                                                savedtime: 0.0)
                        State.currentscreen = 1
                        
                        
                    }, label: {
                        NoiseBlock(backcolor: block.backcolor,
                                   noisetitle: block.noisetitle,
                                   descripton: block.descripton,
                                   duration: block.duration,
                                   image: block.image!
                                   
                        )
                        
                    })
                    
                }
            }
        }.background(LinearGradient(colors: [.red,.orange], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
