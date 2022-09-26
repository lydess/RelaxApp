//
//  LayeredSoundView.swift
//  RelaxApp
//
//  Created by william Vise on 20/9/2022.
//

import SwiftUI

struct LayeredSoundView: View {
    @StateObject var statem = globalstate
    @State var showHelpSheet = false
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        VStack {
           
              
            statem.currentDisplayedItem.image?
                .resizable()
                .frame(width: horizontalSizeClass == .compact ? 300 : UIScreen.main.bounds.width - 200, height: 300, alignment: .center)
                .padding(.top, horizontalSizeClass == .compact ? 0 : 10)
            
            
                
            HStack {
                Text("sounds")
                    .font(.custom("VarelaRound-Regular", size: 20))
                    .foregroundColor(Colorassets.gear)
                    .padding(.leading , horizontalSizeClass == .compact ? 10 : 50)
                    .offset(x: 20, y: 0)
                Spacer()
            }
            VStack{
                ForEach(statem.BackgroundPlayers, id: \.self){ block in
                    VStack {
                        HStack {
                            MixerButton(attachedplayer: block.player, icon:block.image, name: block.name)
                                .padding(.leading, horizontalSizeClass == .compact ? 10: 50)
                            Spacer()
                        }
                    }
                    //TODO remove the force unwrap above
                        
                }
            }
            
                Spacer()
            
        }
    }
}

struct LayeredSoundView_Previews: PreviewProvider {
    static var previews: some View {
        LayeredSoundView()
    }
}


