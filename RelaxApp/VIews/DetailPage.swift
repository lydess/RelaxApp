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
    @State var doshow = false
    @State var Audioisconfigured = false
    @State var block:MenuBlocks
    
    
    var body: some View {
        ZStack{
            VStack {
                HStack{Button("<"){
                    
                    statem.currentscreen = 0}.padding(40)
                    Spacer()
                }
                Spacer()
            }
            VStack{
                Text(block.noisetitle).font(.headline)
                    .padding()
                
                Text(block.descripton).font(.body)
                    .padding()
                
                
                
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
                        
                    }, label: { Text("Play").font(.custom("VarelaRound-Regular", size: 24))
                        
                    })
                } else {
                    Button(action: {
                        print("not dupes")
                        statem.currentPlayingItem = block
                        statem.sharedplayer = audiohandle.SetAudio(fileSelected: block.sound)
                        statem.sharedplayer.numberOfLoops = 100
                        statem.sharedplayer.play()
                        statem.isplaying = true

                        
                    }, label: { Text("Play").font(.custom("VarelaRound-Regular", size: 24))
                        
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



