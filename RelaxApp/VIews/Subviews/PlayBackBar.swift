//
//  PlayBackBar.swift
//  RelaxApp
//
//  Created by william Vise on 17/8/2022.
//

import SwiftUI
import AVFAudio

struct PlayBackBar: View {
    let buttonheight = CGFloat(37)
    let buttonwidth = CGFloat(37)
    let buttonpadding = CGFloat(23)
    let borderradius = CGFloat(65)
    let audiohandle = AudioHandler()
    let player: AVAudioPlayer?
    @StateObject var statem = globalstate
    var block:MenuBlocks
    var time = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            VStack{
                
                HStack{
                    Button(action: {
                        statem.sharedplayer.play()
                    },
                           label: {
                        Image(systemName: "play.fill").resizable().frame(width: buttonwidth, height: buttonheight, alignment: .center)
                    }).padding(buttonpadding)
                        .buttonStyle(.plain)
                    Button(action: {
                        statem.sharedplayer.pause()
                    },
                           label: {
                        Image(systemName: "pause.fill").resizable().frame(width: buttonwidth, height: buttonheight, alignment: .center).padding(buttonpadding)
                        
                    }).buttonStyle(.plain)
                    Button(action: {
                        statem.sharedplayer.stop()
                        statem.isplaying = false
                    },
                           label: {
                        Image(systemName: "stop.fill").resizable().frame(width: buttonwidth, height: buttonheight, alignment: .center).padding(buttonpadding)
                        
                    }).buttonStyle(.plain)
                    
                }
                
            }   .background(Rectangle().foregroundColor(.teal).cornerRadius(borderradius))
                
                .background(.green)
            .cornerRadius(borderradius)
            Text("currently playing: \n")
            Text(statem.currentPlayingItem.noisetitle)
        }
        
            
    }
}

struct PlayBackBar_Previews: PreviewProvider {
    static var previews: some View {
        PlayBackBar(player: nil, block: MenuBlocks(backcolor: .red, noisetitle: "title", descripton: "desc", duration: 60, id: UUID(), sound: .white, savedtime: 0.0))
    }
}
