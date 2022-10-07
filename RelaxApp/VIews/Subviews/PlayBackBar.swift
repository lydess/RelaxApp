//
//  PlayBackBar.swift
//  RelaxApp
//
//  Created by william Vise on 17/8/2022.
//

import SwiftUI
import AVFAudio

struct PlayBackBar: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @StateObject var statem = globalstate
    let buttonheight = CGFloat(40)
    let buttonwidth = CGFloat(40)
    let buttonpadding = CGFloat(15)
    let borderradius = CGFloat(25)
    let buttonoffset = CGFloat(65)
    let audiohandle = AudioHandler()
    let defaults = UserDefaults.standard
    var block:SoundItem
    @State var localplaying = false
    var body: some View {
        VStack {
            ZStack{
                HStack{
                    
                statem.currentPlayingItem.image!
                    .resizable()
                    .frame(width: 70, height: 70, alignment: .center)
                    .padding(.leading,15)
                    .offset(x: 17, y: 0)
                Text(statem.currentPlayingItem.noisetitle)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, buttonheight + 35)
                    .offset(x: 48, y: horizontalSizeClass == .compact ? 0 : 40)
                    
                    Spacer()
                    
                }
                if defaults.bool(forKey: "playpos") {
                    HStack{
                        
                        Button(action: {
                            print(statem.PrimaryPlayer.isPlaying)
                            statem.ispaused = false
                            statem.PrimaryPlayer.play()
                            for i in statem.BackgroundPlayers {
                                i.player.play()
                            }
                            
                            if statem.PrimaryPlayer.isPlaying == true { localplaying = true } else { localplaying = false}
                        },
                               label: {
                            Image(systemName: "play.fill")
                                .resizable()
                                .frame(width: buttonwidth, height: buttonheight, alignment: .center)
                        }).padding([.leading,.bottom,.trailing], buttonpadding)
                            .buttonStyle(.plain)
                            .accessibilityLabel("Play")
                            .foregroundColor( statem.ispaused ? Colorassets.gear : Colorassets.green)
                        Button(action: {
                            statem.ispaused = true
                            for i in statem.BackgroundPlayers {
                                i.player.pause()
                            }
                            statem.PrimaryPlayer.pause()
                            print(statem.PrimaryPlayer.isPlaying)
                            if statem.PrimaryPlayer.isPlaying == true { localplaying = true } else { localplaying = false}
                           
                        },
                               label: {
                            Image(systemName: "pause.fill")
                                .resizable().frame(width: buttonwidth, height: buttonheight, alignment: .center)
                                .padding([.leading,.bottom,.trailing], buttonpadding)
                                
                            
                        }).buttonStyle(.plain)
                            .accessibilityLabel("Pause")
                            .foregroundColor( statem.ispaused ? Colorassets.green : Colorassets.gear)
                        Button(action: {
                            statem.isplaying = false
                            print(statem.isplaying)
                            statem.PrimaryPlayer.stop()
                            
                            for i in statem.BackgroundPlayers {
                                i.player.stop()
                            }
                            
                        },
                               label: {
                            Image(systemName: "stop.fill")
                                .resizable()
                                .accessibilityLabel("Stop")
                                .frame(width: buttonwidth, height: buttonheight, alignment: .center)
                                .padding([.leading,.bottom,.trailing], buttonpadding)
                                .foregroundColor(Colorassets.gear)
                            
                        }).buttonStyle(.plain)
                        
                    }
                    .padding(.leading, buttonoffset)
                } else {
                    HStack{
                        Button(action: {
                            for i in statem.BackgroundPlayers {
                                i.player.stop()
                            }
                            statem.PrimaryPlayer.stop()
                            statem.isplaying = false
                        },
                               label: {
                            Image(systemName: "stop.fill").resizable().frame(width: buttonwidth, height: buttonheight, alignment: .center).padding(buttonpadding)
                            
                        }).buttonStyle(.plain)
                            .accessibilityLabel("Play")
                            .foregroundColor(Colorassets.gear)
                        Button(action: {
                            statem.ispaused = true
                            for i in statem.BackgroundPlayers {
                                i.player.pause()
                            }
                            statem.PrimaryPlayer.pause()
                        },
                               label: {
                            Image(systemName: "pause.fill").resizable().frame(width: buttonwidth, height: buttonheight, alignment: .center).padding(buttonpadding)
                            
                        }).buttonStyle(.plain)
                            .accessibilityLabel("Pause")
                            .foregroundColor( statem.ispaused ? Colorassets.green : Colorassets.gear)
                        Button(action: {
                            statem.ispaused = false
                            for i in statem.BackgroundPlayers {
                                i.player.play()
                            }
                            statem.PrimaryPlayer.play()
                        },
                               label: {
                            Image(systemName: "play.fill").resizable().frame(width: buttonwidth, height: buttonheight, alignment: .center)
                        }).padding(buttonpadding)
                            .buttonStyle(.plain)
                            .accessibilityLabel("Play")
                            .foregroundColor( statem.ispaused ? Colorassets.gear : Colorassets.green)
                        
                    }
                    .padding(.leading, buttonoffset)
                }
                
            }
            
        }
    }
}

struct PlayBackBar_Previews: PreviewProvider {
    static var previews: some View {
        PlayBackBar(block: SoundItem(backcolor: .red, noisetitle: "title", descripton: "desc",  id: UUID(), fontsize: 18, sound: .white, islayeredsound: false))
    }
}
