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
    let buttonpadding = CGFloat(10)
    let borderradius = CGFloat(25)
    let audiohandle = AudioHandler()
    let defaults = UserDefaults.standard
    var block:MenuBlocks
    
    var body: some View {
        VStack {
            ZStack{
                HStack{
                    
                statem.currentPlayingItem.image!
                    .resizable()
                    .frame(width: 70, height: 70, alignment: .center)
                    .padding(.leading,15)
                Text(statem.currentPlayingItem.noisetitle)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, buttonheight + 35)
                    .padding(.leading, 10)
                    Spacer()
                    
                }
                if defaults.bool(forKey: "playpos") {
                    HStack{
                        Button(action: {
                            statem.sharedplayer.play()
                        },
                               label: {
                            Image(systemName: "play.fill")
                                .resizable()
                                .frame(width: buttonwidth, height: buttonheight, alignment: .center)
                        }).padding([.leading,.bottom,.trailing], buttonpadding)
                            .buttonStyle(.plain)
                        Button(action: {
                            statem.sharedplayer.pause()
                        },
                               label: {
                            Image(systemName: "pause.fill")
                                .resizable().frame(width: buttonwidth, height: buttonheight, alignment: .center)
                                .padding([.leading,.bottom,.trailing], buttonpadding)
                                
                            
                        }).buttonStyle(.plain)
                        Button(action: {
                            statem.sharedplayer.stop()
                            statem.isplaying = false
                        },
                               label: {
                            Image(systemName: "stop.fill")
                                .resizable()
                                .frame(width: buttonwidth, height: buttonheight, alignment: .center)
                                .padding([.leading,.bottom,.trailing], buttonpadding)
                            
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
                
            }
            
        }
    }
}

struct PlayBackBar_Previews: PreviewProvider {
    static var previews: some View {
        PlayBackBar(block: MenuBlocks(backcolor: .red, noisetitle: "title", descripton: "desc",  id: UUID(), sound: .white))
    }
}
