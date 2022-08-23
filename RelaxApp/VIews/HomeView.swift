//
//  HomeView.swift
//  RelaxApp
//
//  Created by william Vise on 16/8/2022.
//

import SwiftUI
import Dispatch


struct HomeView: View {
    @StateObject var State = globalstate
    @StateObject var Gyro = GyroManager()
    @State var openinganim = false
    @State var animoffsety = CGFloat(850)
    @State var animoffsetx = CGFloat(0)
    @State var openinganimcomplete = false
    let debug = Debug()
    
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
                    }, label: {Image(systemName: "gearshape")
                        .resizable()
                        .frame(width: 33, height: 33, alignment: .center)
                        .foregroundColor(Colorassets.gear)
                    }).buttonStyle(.plain)
                        .foregroundColor(Colorassets.silver)
                }
                Text("Tracks")
                        .font(.custom("VarelaRound-Regular", size: 24))
                        .onAppear(perform: {State.currentlist = debug.setuplist()})
                        .foregroundColor(Colorassets.gear)
                        .padding(.trailing, 90)
                    }
            }.padding(.top,10) }
            ScrollView{
                ForEach(State.currentlist, id: \.id){ block in
                    HStack {
                        Button(action: {
                            State.currentDisplayedItem = MenuBlocks(backcolor: block.backcolor, noisetitle: block.noisetitle,
                                                                    descripton: block.descripton, duration: 6,
                                                                    image: block.image, id: UUID(),
                                                                    sound: block.sound, savedtime: 0.0)
                            State.currentscreen = 1
                               
                        }, label: {
                            NoiseBlock(backcolor: block.backcolor,
                                       noisetitle: block.noisetitle,
                                       textcolor: Color(.black),
                                       descripton: block.descripton,
                                       duration: block.duration,
                                       image: block.image!
                            )
                            block.image?
                                .resizable()
                                .frame(width: 100, height: 100, alignment: .center)
                                .cornerRadius(5)
                                .padding()
                        }).buttonStyle(.plain)
                            .offset(x: Gyro.rolly / 7, y: animoffsety + Gyro.rollx / 11)
                            .animation(.interactiveSpring(response: 1.0, dampingFraction: 0.55, blendDuration: 2).delay(Double.random(in: 0.1...0.3)), value: openinganim)
                            
                    }.frame(width: 400, height: 125, alignment: .center)
                        .onAppear(perform: {
                            print(UserDefaults.standard.bool(forKey: "firstlaunch"))
                            if UserDefaults.standard.bool(forKey: "firstlaunch") == false {
                                animoffsety = CGFloat(850)
                                openinganim.toggle()
                                animoffsety = 0
                                UserDefaults.standard.set(true, forKey: "firstlaunch")
                                print("first launch, executing")
                            } else {
                                animoffsety = CGFloat(0)
                                openinganimcomplete.toggle()
                            }
                        })
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

