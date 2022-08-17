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
    var pview = ProgressView(value: 0.5)
    var block:MenuBlocks
    var time = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack{
            VStack{
                Text(block.noisetitle).font(.headline)
                    .padding()
                Text(block.descripton).font(.body)
                    .padding()
                block.image
                Spacer()
            }
        
        HStack{
            Button(action: {print("tap")},
                   label: {Image(systemName: "gearshape.fill")})
            Button(action: {doshow.toggle()},
                   label: {Image(systemName: "playpause.fill")})
            Button(action: {print("tap")},
                   label: {Image(systemName: "stop.fill")})
            
            if doshow {ProgressView().task {
                statem.sharedplayer = audiohandle.Play()
                statem.sharedplayer.play()
                statem.audioisplaying.toggle()
            }}
            
            
        }
            if statem.audioisplaying {
                ProgressView(value: statem.musicstatus)
                    .onReceive(time) { _ in
                        statem.musicstatus = statem.sharedplayer.currentTime / statem.sharedplayer.duration
                        self.time.upstream.connect().cancel()
                        if statem.sharedplayer.isPlaying == false {
                            statem.musicstatus = 0.0
                            statem.audioisplaying = false
                            doshow.toggle()
                            
                        }
                    }
                    .frame(width: 250, height: 100, alignment: .center)
                    .offset(x: 0, y: 100)
                Button("debug"){
                    
                    
                }.offset(x: 0, y: -50)
                
            }
        }
    }
}

struct DetailPage_Previews: PreviewProvider {
    static var previews: some View {
        DetailPage(block: MenuBlocks(backcolor: .red, noisetitle: "Title", descripton: "Desc", duration: 50, id: UUID()))
    }
}
