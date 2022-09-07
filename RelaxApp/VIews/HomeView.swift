//
//  HomeView.swift
//  RelaxApp
//
//  Created by william Vise on 16/8/2022.
//

import SwiftUI



struct HomeView: View {
    @StateObject var State = globalstate
    @StateObject var Gyro = Gyrostate
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
                        State.currentscreen = .Options
                    }, label: {Image(systemName: "gearshape")
                        .resizable()
                        .frame(width: 33, height: 33, alignment: .center)
                        .foregroundColor(Colorassets.gear)
                    }).buttonStyle(.plain)
                        .foregroundColor(Colorassets.silver)
                        .padding(.trailing, 50)
                        .accessibilityLabel("Settings")
                }
                Text("Tracks")
                        .font(.custom("VarelaRound-Regular", size: 26))
                        .onAppear(perform: {State.currentlist = debug.setuplist()})
                        .foregroundColor(Colorassets.gear)
                        .padding(.trailing, 30)
                    }
            }.padding(.top,30)
               
            }
            
            
            ScrollView{
                
                ForEach(State.currentlist, id: \.id){ block in
                    HStack {
                        Button(action: {
                            
                            withAnimation{State.currentscreen = .DetailScreen}
                            
                            State.currentDisplayedItem =
                            MenuBlocks(backcolor: block.backcolor,
                                       noisetitle: block.noisetitle,
                                        descripton: block.descripton,
                                        image: block.image,
                                        id: block.id,
                                        sound: block.sound
                            )
                            
                        }, label: {
                            NoiseBlock(backcolor: block.backcolor,
                                       noisetitle: block.noisetitle,
                                       textcolor: .black,
                                       descripton: block.descripton,
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
            }.frame(minWidth: UIScreen.main.bounds.width,
                    idealWidth: UIScreen.main.bounds.width,
                    maxWidth: UIScreen.main.bounds.width,
                    minHeight: 100,
                    idealHeight: 400,
                    maxHeight: UIScreen.main.bounds.height,
                    alignment: .center)
            .padding(.top,15)
            Spacer()
           
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

