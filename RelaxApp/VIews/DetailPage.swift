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
            VStack {
                HStack{Button("<"){
                    withAnimation{statem.currentscreen = 0}
                    
                    }.padding(40)
                    Spacer()
                }
                Spacer()
            }
            VStack{
                if statem.currentscreen == 1 {
                    VStack{
                    Text(block.noisetitle).font(.headline)
                        .padding()
                    
                    Text(block.descripton).font(.body)
                        .padding()
                    
                    }
                } else {
                    /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
                }
                
                block.image?.resizable()
                    .frame(width: UIScreen.main.bounds.width , height: 400, alignment: .center).padding(20)
                if statem.isplaying && statem.currentPlayingItem.noisetitle == block.noisetitle {
                    
                }else if statem.isplaying {
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

                        
                    }, label: { Text("Listen").font(.custom("VarelaRound-Regular", size: 24))
                        
                    })
                    
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



