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
    init() {
         UIScrollView.appearance().bounces = false
      }
    var body: some View {
        VStack {
            VStack{
            HStack {
                ZStack{
                HStack{
                    Rectangle().foregroundColor(.clear).frame(width: 300, height: 44, alignment: .center)
                    Button(action: {
                        State.currentscreen = 2
                    }, label: {Image(systemName: "gearshape.fill")
                        .resizable()
                        .frame(width: 33, height: 33, alignment: .center)
                        
                    }).buttonStyle(.plain)
                        .foregroundColor(Colorassets.silver)
                }
                Text("Sounds")
                        .font(.custom("VarelaRound-Regular", size: 24))
                        .onAppear(perform: {State.currentlist = debug.setuplist()})
                }
                
            }.padding(.top,10)
            
            }
                
            
                    
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
                        withAnimation{
                            State.currentscreen = 1
                        }
                        
                        
                    }, label: {
                        NoiseBlock(backcolor: block.backcolor,
                                   noisetitle: block.noisetitle,
                                   descripton: block.descripton,
                                   duration: block.duration,
                                   image: block.image!
                                   
                        )
                        
                    }).buttonStyle(.plain)
                    
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
