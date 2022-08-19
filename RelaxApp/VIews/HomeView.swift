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
                Text("Tracks")
                        .font(.custom("VarelaRound-Regular", size: 24))
                        .onAppear(perform: {State.currentlist = debug.setuplist()})
                }
                
            }.padding(.top,10)
            
            }
                
            
                    
            ScrollView{
                ForEach(State.currentlist, id: \.id){ block in
                    HStack {
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
                            block.image?
                                .resizable()
                                .frame(width: 100, height: 100, alignment: .center)
                                .cornerRadius(2)
                                .padding()
                            
                        }).buttonStyle(.plain)
                            .shadow(color: block.backcolor, radius: 20, x: -5, y: 5)
                            
                        
                        
                    }.frame(width: 400, height: 125, alignment: .center)
                    
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
