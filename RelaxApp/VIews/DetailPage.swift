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
    var pview = ProgressView(value: 0.5)
    var block:MenuBlocks
    
    var time = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack{
            VStack{
                Text(block.noisetitle).font(.headline)
                    .padding()
                HStack{Button("<"){statem.currentscreen = 0}}
                Text(block.descripton).font(.body)
                    .padding()
                block.image
                Spacer()
            }
            
            VStack {
                Spacer()
                HStack{
                Button(action: {print("tap")},
                       label: {Image(systemName: "gearshape.fill").resizable().frame(width: 44, height: 44, alignment: .center).padding()})
                VStack {
                    if statem.sharedplayer.isPlaying == false {
                        if Audioisconfigured {
                            Button(action: {
                                statem.sharedplayer.play()
                           
                        },
                                   label: {Image(systemName: "play.fill").resizable().frame(width: 44, height: 44, alignment: .center).padding(40.0)})
                        } else {
                        
                        Button(action: {
                        doshow.toggle()
                      
                    },
                               label: {Image(systemName: "play.fill").resizable().frame(width: 44, height: 44, alignment: .center).padding(40.0)})
                    }
                    }
                    else {
                            Button(action: {
                            statem.sharedplayer.pause()
                            
                        },
                                   label: {Image(systemName: "pause.fill").resizable().frame(width: 44, height: 44, alignment: .center).padding(40.0)})
                        
                        
                    }
                }
                Button(action: {print("tap")},
                       label: {Image(systemName: "stop.fill").resizable().frame(width: 44, height: 44, alignment: .center)})
                
                if doshow {ProgressView().task {
                    statem.sharedplayer = audiohandle.SetAudio(fileSelected: block.sound)
                    if Audioisconfigured == false { statem.sharedplayer.play()
                        Audioisconfigured.toggle()
                    }
                    
                    doshow.toggle()
                }}
                
                
                }
            }.padding(.bottom,50)
            if Audioisconfigured {
                ProgressView(value: statem.musicstatus)
                    .progressViewStyle(.linear)
                    .onReceive(time) { _ in
                        statem.musicstatus = statem.sharedplayer.currentTime / statem.sharedplayer.duration
                        self.time.upstream.connect().cancel()
                    }
                    .frame(width: 250, height: 100, alignment: .center)
                    .offset(x: 0, y: 100)
                    
                Button("debug"){
                    statem.sharedplayer.currentTime = 2.0
                    
                    
                }.offset(x: 0, y: -50)
                
            }
        }
    }
}

struct DetailPage_Previews: PreviewProvider {
    static var previews: some View {
        DetailPage(block: MenuBlocks(backcolor: .red, noisetitle: "Title", descripton: "Desc", duration: 50, id: UUID(), sound: .tada))
    }
}
