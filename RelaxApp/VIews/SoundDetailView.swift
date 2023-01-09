//
//  DetailPage.swift
//  RelaxApp
//
//  Created by william Vise on 16/8/2022.
//

import SwiftUI
import AVKit
struct SoundDetailView: View {
    
    var player: AVAudioPlayer?
    @StateObject var statem = globalstate
    @State var anim = false
    var body: some View {
        ZStack{
            VStack{
                HStack {
                    
                }
                
                statem.currentDisplayedItem.image?.resizable()
                    .frame(minWidth: UIScreen.main.bounds.width,
                           idealWidth: UIScreen.main.bounds.width,
                           maxWidth: UIScreen.main.bounds.width,
                           minHeight: 300,
                           idealHeight: 400,
                           maxHeight: 400,
                           alignment: .center)
                    .gesture(DragGesture(minimumDistance: 100, coordinateSpace: .local)
                        .onChanged{ trans in
                            if trans.startLocation.y < trans.location.y {
                                statem.currentHeader = ScreenPages.HomeView
                            }
                        })
            VStack {
                VStack{
                    Text(statem.currentDisplayedItem.descripton)
                    .padding(20)
                    .font(.custom("VarelaRound-Regular", size: 17))
                    .foregroundColor(ColorAssets.black)
                }
                HStack{
                    
                    if statem.isplaying && statem.currentPlayingItem.noisetitle == statem.currentDisplayedItem.noisetitle {
                    
                } else if statem.isplaying {
                    Button(action: {
                        statem.currentPlayingItem = statem.currentDisplayedItem
                        statem.PrimaryPlayer.stop()
                        statem.isplaying = false
                        for i in statem.BackgroundPlayers {
                            i.player.stop()
                        }
                        statem.PrimaryPlayer = Audio.SetAudio(fileSelected: statem.currentDisplayedItem.sound)
                        statem.PrimaryPlayer.numberOfLoops = 100
                        statem.PrimaryPlayer.play()
                        statem.isplaying = true
                        statem.UpdateNowPlaying(block: statem.currentDisplayedItem)
                    }, label: {
                        Text("Listen")
                            .font(.custom("VarelaRound-Regular", size: 24))
                            
                            .padding()
                        .foregroundColor(ColorAssets.gear)
                        .background(content: {
                            ZStack {
                                Rectangle()
                                    .frame(width: 95, height: 45, alignment: .center)
                                    .cornerRadius(40)
                                    .foregroundColor(ColorAssets.gear)
                                Rectangle()
                                    .frame(width: 85, height: 33, alignment: .center)
                                    .foregroundColor(ColorAssets.mainback)
                                    .cornerRadius(40)
                            }
                        }
                    )
                
                })
                } else {
                    Button(action: {
                        statem.currentPlayingItem = statem.currentDisplayedItem
                        statem.PrimaryPlayer = Audio.SetAudio(fileSelected: statem.currentDisplayedItem.sound)
                        for i in statem.BackgroundPlayers {
                            i.player.stop()
                        }
                        statem.PrimaryPlayer.numberOfLoops = 100
                        statem.PrimaryPlayer.play()
                        
                        statem.UpdateNowPlaying(block: statem.currentDisplayedItem)
                        statem.isplaying = true
                        
                    }, label: {
                            Text("Listen")
                                .font(.custom("VarelaRound-Regular", size: 24))
                                
                                .padding()
                            .foregroundColor(ColorAssets.gear)
                            .background(content: {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 95, height: 45, alignment: .center)
                                        .cornerRadius(40)
                                        .foregroundColor(ColorAssets.gear)
                                    Rectangle()
                                        .frame(width: 85, height: 33, alignment: .center)
                                        .foregroundColor(ColorAssets.mainback)
                                        .cornerRadius(40)
                                }
                            })
                    })
                }
                    
                    
                    
                    
                }
                
                }
                    
                }
        }
        
    }
}

struct DetailPage_Previews: PreviewProvider {
    static var previews: some View {
        SoundDetailView()
    }
}



