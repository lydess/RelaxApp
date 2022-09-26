//
//  TrackListScrollView.swift
//  RelaxApp
//
//  Created by william Vise on 17/9/2022.
//

import SwiftUI

struct TrackListScrollView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @StateObject var State = globalstate
    @StateObject var Gyro = Gyrostate
    @State var openinganim = false
    @State var animoffsety = CGFloat(850)
    @State var animoffsetx = CGFloat(0)
    @State var openinganimcomplete = false
    private var gridconfig = GridItem(.adaptive(minimum: 150), spacing: 100, alignment: .center)
    var body: some View {
        VStack {
            if horizontalSizeClass == .compact {
                ScrollView{
                ForEach(State.currentlist, id: \.id){ block in
                    HStack {
                        Button(action: {
                            
                            State.currentDisplayedItem =
                            SoundItem(
                                       backcolor: block.backcolor,
                                       noisetitle: block.noisetitle,
                                       descripton: block.descripton,
                                       image: block.image,
                                       id: block.id,
                                       sound: block.sound,
                                       islayeredsound: block.islayeredsound,
                                       layeredsounds: block.layeredsounds
                                    
                            )
                            Task(priority: .background, operation: {withAnimation{
                                if block.islayeredsound = true {
                                    State.currentscreen = .Layerdsound
                                }else {
                                    State.currentscreen = .DetailScreen
                                }
                            }})
                            
                            
                        }, label: {
                            NoiseBlock(backcolor: block.backcolor,
                                       noisetitle: block.noisetitle,
                                       textcolor: .black,
                                       descripton: block.descripton,
                                       image: block.image!,
                                       fontsize: 28
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
                
} else {
    LazyVGrid(columns: [gridconfig, gridconfig] , alignment: .center, spacing: 150, content: {
        ForEach(0...3, id:\.self){ i in
                let block = State.currentlist[i]
                
            Button(action: {
                
                withAnimation{State.currentscreen = .DetailScreen}
                
                State.currentDisplayedItem =
                SoundItem(backcolor: block.backcolor,
                            noisetitle: block.noisetitle,
                            descripton: block.descripton,
                            image: block.image,
                            id: block.id,
                          sound: block.sound, islayeredsound: block.islayeredsound
                )
                
            }, label: {
                VStack{
                    NoiseBlock(backcolor: block.backcolor,
                                noisetitle: block.noisetitle,
                                textcolor: .black,
                                descripton: block.descripton,
                                image: block.image!,
                                fontsize: 18
                    ).frame(width: 180, height: 100, alignment: .center)
                    block.image?
                        .resizable()
                        .frame(width: 180, height: 150, alignment: .center)
                        .cornerRadius(5)
                        
                }
            }).buttonStyle(.plain)
                    .task {
                        State.cellcount += 1
                        print(State.cellcount)
                    }
                
            }
    })
    
            }
        }
    }
}

struct TrackListScrollView_Previews: PreviewProvider {
    static var previews: some View {
        TrackListScrollView()
    }
}
