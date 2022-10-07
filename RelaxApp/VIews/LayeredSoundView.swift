//
//  LayeredSoundView.swift
//  RelaxApp
//
//  Created by william Vise on 20/9/2022.
//

import SwiftUI
var gsd = globalstate
struct LayeredSoundView: View {
    @StateObject var statem = globalstate
    @State var showHelpSheet = false
    @State var swap = false
    @State var active = false
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        VStack {
            if horizontalSizeClass == .compact {
                statem.currentDisplayedItem.image?
                    .resizable()
                    //.frame(width: 300, height: 300, alignment: .center)
                    .frame(minWidth: 300, idealWidth: 300, maxWidth: 300, minHeight: 200, idealHeight: 300, maxHeight: 300, alignment: .center)
                   
            } else {
                statem.currentDisplayedItem.image?
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width - 200, height: 600, alignment: .center)
                    .padding(.top, 10)
            }
            
              
            
            HStack {
                Text("sounds")
                    .font(.custom("VarelaRound-Regular", size: 20))
                    .foregroundColor(Colorassets.gear)
                    .padding(.leading , horizontalSizeClass == .compact ? 10 : 50)
                    .offset(x: 20, y: 0)
                Spacer()
                
                Button(action: {for x in statem.BackgroundPlayers {
                    x.player.pause()
                    
                }
                swap.toggle()}, label: {
                    Text("Stop Playing")
                        .font(.custom("VarelaRound-Regular", size: 20))
                        
                        .padding()
                    .foregroundColor(Colorassets.gear)
                    .background(content: {
                        ZStack {
                            Rectangle()
                                .frame(width: 200, height: 45, alignment: .center)
                                .cornerRadius(40)
                                .foregroundColor(Colorassets.gear)
                            Rectangle()
                                .frame(width: 185, height: 33, alignment: .center)
                                .foregroundColor(Colorassets.mainback)
                                .cornerRadius(40)
                        }
                    }
                )
            
                })
                Spacer()
            }
            
                VStack{
                    if swap {
                        
                        ForEach(statem.BackgroundPlayers, id: \.self){ block in
                            VStack {
                                HStack {
                                    MixerButton(attachedplayer: block.player, icon: block.image, name: block.name, id: block.id)
                                    Spacer()
                                }
                            }
                        }
                        
                    } else
                    {
                        ForEach(statem.BackgroundPlayers, id: \.self){ block in
                            VStack {
                                HStack {
                                    MixerButton(attachedplayer: block.player, icon: block.image, name: block.name, id: block.id)
                                    Spacer()
                                }
                            }
                        }
                        
                    }
                }
                .padding(.leading, horizontalSizeClass == .compact ? 10 : 50)
            
            //Spacer()
        }
       
            
    }
    
}

struct LayeredSoundView_Previews: PreviewProvider {
    static var previews: some View {
        LayeredSoundView()
    }
}


