//
//  TrackListScrollView.swift
//  RelaxApp
//
//  Created by william Vise on 17/9/2022.
//

import SwiftUI
import AVFAudio

struct TrackListScrollView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @StateObject private var State = globalstate
    @StateObject private var gyro = Gyro
    @State private var openinganim = false
    @State private var animoffsety = CGFloat(850)
    @State private var animoffsetx = CGFloat(0)
    @State private var openinganimcomplete = false
    private var gridconfig = GridItem(.adaptive(minimum: 100), spacing: 75, alignment: .top)
    var body: some View {
        VStack() {
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
                                       id: block.id, fontsize: block.fontsize,
                                       sound: block.sound,
                                       islayeredsound: block.islayeredsound,
                                       layeredsounds: block.layeredsounds
                                    
                            )
                            
                            Task(priority: .background, operation: {withAnimation{
                                if block.islayeredsound == true {
                                    
                                    State.PrimaryPlayer.stop()
                                    State.isplaying = false
                                    State.BackgroundPlayers = State.currentDisplayedItem.layeredsounds
                                    State.activemixers = {
                                        var final = [MixerButton]()
                                        for x in State.BackgroundPlayers {
                                            final.append(MixerButton(attachedplayer: x.player, icon: x.image, name: x.name, id: x.id))
                                        }
                                        return final
                                    }()
                                    print(State.activemixers)
                                    State.currentPlayingItem = block
                                    State.UpdateNowPlaying(block: State.currentDisplayedItem)
                                    
                                    withAnimation(Animation.spring()){State.currentHeader = ScreenPages.LayeredSoundView}
                                        
                                }else {
                                    withAnimation(Animation.spring()){State.currentHeader = ScreenPages.DetailView}
                                    
                                }
                            }})
                            
                            
                        }, label: {
                            NoiseBlock(backcolor: block.backcolor,
                                       noisetitle: block.noisetitle,
                                       textcolor: .black,
                                       descripton: block.descripton,
                                       image: block.image!,
                                       fontsize: CGFloat(block.fontsize)
                            )
                            block.image?
                                .resizable()
                                .frame(width: 100, height: 75, alignment: .center)
                                .cornerRadius(5)
                                .padding(.trailing, 20)
                                
                        }).buttonStyle(.plain)
                            .offset(x: Gyro.rolly / 7, y: animoffsety + Gyro.rollx / 11)
                            .animation(.interactiveSpring(response: 1.0, dampingFraction: 0.55, blendDuration: 2).delay(Double.random(in: 0.1...0.3)), value: openinganim)
                        
                    }.frame(width: 400, height: 100, alignment: .top)
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
                    
            }
        
                
} else {
    VStack {
        
        LazyVGrid(columns: [gridconfig, gridconfig] , alignment: .center, spacing: 125, content: {
            ForEach(0...4, id:\.self){ i in
                    let block = State.currentlist[i]
                    
                Button(action: {
                    State.currentDisplayedItem =
                    SoundItem(backcolor: block.backcolor,
                                noisetitle: block.noisetitle,
                                descripton: block.descripton,
                                image: block.image,
                                id: block.id,
                                fontsize: block.fontsize,
                                sound: block.sound,
                                islayeredsound: block.islayeredsound,
                                layeredsounds: block.layeredsounds
                    )
                    
                    if block.islayeredsound == true {
                        State.BackgroundPlayers = State.currentDisplayedItem.layeredsounds
                        State.activemixers = {
                            var final = [MixerButton]()
                            for x in State.BackgroundPlayers {
                                final.append(MixerButton(attachedplayer: x.player, icon: x.image, name: x.name, id: x.id))
                            }
                            return final
                        }()
                        State.currentHeader = ScreenPages.LayeredSoundView
                        print(State.activemixers)
                    }else {
                        State.currentHeader = ScreenPages.DetailView
                    }
                }, label: {
                    
                    VStack{
                        NoiseBlock(backcolor: block.backcolor,
                                    noisetitle: block.noisetitle,
                                    textcolor: .black,
                                    descripton: block.descripton,
                                    image: block.image!,
                                    fontsize: CGFloat(block.fontsize)
                                   
                        ).frame(width: 200, height: 100, alignment: .center)
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
        
        Spacer()
    }
    
    
            }
        }
    }
}

struct TrackListScrollView_Previews: PreviewProvider {
    static var previews: some View {
        TrackListScrollView()
    }
}
