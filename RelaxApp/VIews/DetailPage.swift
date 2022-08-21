//
//  DetailPage.swift
//  RelaxApp
//
//  Created by william Vise on 16/8/2022.
//

import SwiftUI
import AVKit
struct DetailPage: View {
    var audiohandle = AudioHandler()
    var player: AVAudioPlayer?
    @StateObject var statem = globalstate

    @State var block:MenuBlocks
    
    
    var body: some View {
        ZStack{
                
            
            VStack{
                if statem.currentscreen == 1 {
                    VStack{
                    Text(block.noisetitle)
                        .padding()
                        .animation(.easeInOut(duration: 5), value: statem.currentscreen)
                        .font(.custom("VarelaRound-Regular", size: 26))
                        .offset(x: 0, y: 10)
                        .foregroundColor(Colorassets.gear)
                    
                    Text(block.descripton)
                        .padding(20)
                        .animation(.easeInOut(duration: 5), value: statem.currentscreen)
                        .font(.custom("VarelaRound-Regular", size: 17))
                        .foregroundColor(Colorassets.black)
                    
                    }
                } else {
                    /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
                }
                
                block.image?.resizable()
                    .frame(width: UIScreen.main.bounds.width , height: 400, alignment: .center).padding(20)
                    .gesture(DragGesture(minimumDistance: 100, coordinateSpace: .local)
                        .onChanged{ trans in
                            var lastpoint = trans.location.y
                            if trans.startLocation.y < trans.location.y {
                                withAnimation{statem.currentscreen = 0}
                            }
                            
                            
                        })
                ZStack{
                    HStack{
                    
                if statem.isplaying && statem.currentPlayingItem.noisetitle == block.noisetitle {
                    
                } else if statem.isplaying {
                    Button(action: {
                            print("dupes")
                            statem.currentPlayingItem = block
                            statem.sharedplayer.stop()
                            statem.isplaying = false
                            statem.sharedplayer = audiohandle.SetAudio(fileSelected: block.sound)
                            statem.sharedplayer.numberOfLoops = 100
                            statem.sharedplayer.play()
                            statem.isplaying = true
                            statem.UpdateNowPlaying(block: block)
                    }, label: { Text("Listen").font(.custom("VarelaRound-Regular", size: 24))
                    })
                } else {
                    Button(action: {
                        print("not dupes")
                        statem.currentPlayingItem = block
                        statem.sharedplayer = audiohandle.SetAudio(fileSelected: block.sound)
                        statem.sharedplayer.numberOfLoops = 100
                        statem.sharedplayer.play()
                        statem.isplaying = true
                        statem.UpdateNowPlaying(block: block)
                    }, label: {
                            Text("Listen")
                                .font(.custom("VarelaRound-Regular", size: 24))
                            .foregroundColor(Colorassets.gear)
                            .background(content: {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 95, height: 45, alignment: .center)
                                        .cornerRadius(40)
                                        .foregroundColor(Colorassets.gear)
                                    Rectangle()
                                                .frame(width: 85, height: 33, alignment: .center)
                                                .foregroundColor(Colorassets.mainback)
                                                .cornerRadius(40)
                                }
                            }
                            )
                    })
                    
                }}
                    HStack{
                        Spacer()
                        Button(
                            action: {
                                withAnimation{statem.currentscreen = 0}
                            
                        },
                            label: {
                                Image(systemName: "chevron.down")
                                    .foregroundColor(Colorassets.gear)
                            
                        }
                        ).padding(.trailing, 50)
                    }
                }
                Spacer()
            }
        }
    }
}

struct DetailPage_Previews: PreviewProvider {
    static var previews: some View {
        DetailPage(block: MenuBlocks(backcolor: .red, noisetitle: "Title", descripton: "Desc", duration: 50, id: UUID(), sound: .white, savedtime: 0.0))
    }
}



