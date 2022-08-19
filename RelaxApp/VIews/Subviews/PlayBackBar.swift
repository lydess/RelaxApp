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
    let audiohandle = AudioHandler()
    let player: AVAudioPlayer?
    @StateObject var statem = globalstate
    var block:MenuBlocks
    var time = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack{
            ProgressView(value: statem.sharedplayer.currentTime)
                .frame(width: 250, height: 100, alignment: .center)
                .onReceive(time) { _ in
                    
                }
                .onAppear(perform: {
                statem.sharedplayer = audiohandle.SetAudio(fileSelected: block.sound)
                })
                
                
            HStack{
                Button(action: {
                    print("fred")
                },
                       label: {
                    Image(systemName: "play.fill").resizable().frame(width: buttonwidth, height: buttonheight, alignment: .center)
                }).padding(40)
                Button(action: {
                    
                },
                       label: {
                    Image(systemName: "pause.fill").resizable().frame(width: buttonwidth, height: buttonheight, alignment: .center)
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
