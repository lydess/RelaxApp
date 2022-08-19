//
//  PlayBackBar.swift
//  RelaxApp
//
//  Created by william Vise on 17/8/2022.
//

import SwiftUI
import AVFAudio

struct PlayBackBar: View {
    let buttonheight = CGFloat(44)
    let buttonwidth = CGFloat(44)
    var buttonpadding = CGFloat(25)
    let audiohandle = AudioHandler()
    let player: AVAudioPlayer?
    @StateObject var statem = globalstate
    var block:MenuBlocks
    var time = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack{
            ProgressView(value: statem.sharedplayer.currentTime / statem.sharedplayer.duration)
                .frame(width: 250, height: 100, alignment: .center)
                .onReceive(time) { _ in
                    
                }
            // TODO: REMOVE DEBUG ONAPPEAR SECTION
                
                
                
            HStack{
                Button(action: {
                    statem.sharedplayer.play()
                },
                       label: {
                    Image(systemName: "play.fill").resizable().frame(width: buttonwidth, height: buttonheight, alignment: .center)
                }).padding(buttonpadding)
                Button(action: {
                    statem.sharedplayer.pause()
                },
                       label: {
                    Image(systemName: "pause.fill").resizable().frame(width: buttonwidth, height: buttonheight, alignment: .center).padding(buttonpadding)
                    
                })
                Button(action: {
                    statem.sharedplayer.stop()
                    statem.isplaying = false
                },
                       label: {
                    Image(systemName: "stop.fill").resizable().frame(width: buttonwidth, height: buttonheight, alignment: .center).padding(buttonpadding)
                    
                })
                
            }
        }
    }
}

struct PlayBackBar_Previews: PreviewProvider {
    static var previews: some View {
        PlayBackBar(player: nil, block: MenuBlocks(backcolor: .red, noisetitle: "title", descripton: "desc", duration: 60, id: UUID(), sound: .payday, savedtime: 0.0))
    }
}
