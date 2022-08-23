//
//  PlayBackBar.swift
//  RelaxApp
//
//  Created by william Vise on 17/8/2022.
//

import SwiftUI
import AVFAudio

struct PlayBackBar: View {
    @StateObject var statem = globalstate
    let buttonheight = CGFloat(40)
    let buttonwidth = CGFloat(40)
    let buttonpadding = CGFloat(29)
    let borderradius = CGFloat(25)
    let audiohandle = AudioHandler()
    let player: AVAudioPlayer?
    let defaults = UserDefaults.standard
    var block:MenuBlocks
    
    var body: some View {
        VStack {
            VStack{
                
                if defaults.bool(forKey: "playpos") {
                    HStack{
                        Button(action: {
                            statem.sharedplayer.play()
                        },
                               label: {
                            Image(systemName: "play.fill")
                                .resizable()
                                .frame(width: buttonwidth, height: buttonheight, alignment: .center)
                        }).padding(buttonpadding)
                            .buttonStyle(.plain)
                        Button(action: {
                            statem.sharedplayer.pause()
                        },
                               label: {
                            Image(systemName: "pause.fill")
                                .resizable().frame(width: buttonwidth, height: buttonheight, alignment: .center)
                                .padding(buttonpadding)
                            
                        }).buttonStyle(.plain)
                        Button(action: {
                            statem.sharedplayer.stop()
                            statem.isplaying = false
                        },
                               label: {
                            Image(systemName: "stop.fill").resizable().frame(width: buttonwidth, height: buttonheight, alignment: .center).padding(buttonpadding)
                            
                        }).buttonStyle(.plain)
                        
                    }
                } else {
                    HStack{
                        Button(action: {
                            statem.sharedplayer.stop()
                            statem.isplaying = false
                        },
                               label: {
                            Image(systemName: "stop.fill").resizable().frame(width: buttonwidth, height: buttonheight, alignment: .center).padding(buttonpadding)
                            
                        }).buttonStyle(.plain)
                        Button(action: {
                            statem.sharedplayer.pause()
                        },
                               label: {
                            Image(systemName: "pause.fill").resizable().frame(width: buttonwidth, height: buttonheight, alignment: .center).padding(buttonpadding)
                            
                        }).buttonStyle(.plain)
                        Button(action: {
                            statem.sharedplayer.play()
                        },
                               label: {
                            Image(systemName: "play.fill").resizable().frame(width: buttonwidth, height: buttonheight, alignment: .center)
                        }).padding(buttonpadding)
                            .buttonStyle(.plain)
                        
                    }
                }
                
            }   .background(Rectangle().foregroundColor(Colorassets.gear).cornerRadius(borderradius))
                
                .background(.green)
            .cornerRadius(borderradius)
            Text(statem.currentPlayingItem.noisetitle)
        }
        
            
    }
}

struct PlayBackBar_Previews: PreviewProvider {
    static var previews: some View {
        PlayBackBar(player: nil, block: MenuBlocks(backcolor: .red, noisetitle: "title", descripton: "desc",  id: UUID(), sound: .white))
    }
}
