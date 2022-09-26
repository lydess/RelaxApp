//
//  LayeredSoundView.swift
//  RelaxApp
//
//  Created by william Vise on 20/9/2022.
//

import SwiftUI

struct LayeredSoundView: View {
    @StateObject var statem = globalstate
    @State var showpopover = false
    
    var body: some View {
        VStack {
            HStack{
                Button(action: {statem.currentscreen = .DetailScreen}, label: {
                    Image(systemName: "chevron.down")
                    
                }).padding(.top, 100)
                
            }
            statem.currentDisplayedItem.image?
                .resizable()
                .frame(width: 300, height: 300, alignment: .center)
                
                Spacer()
            Text("sounds")
                .font(.custom("VarelaRound-Regular", size: 20))
                .padding(.trailing, 100)
            VStack{
                ForEach(statem.BackgroundPlayers, id: \.self){ block in
                    VStack {
                        HStack {
                            MixerButton(attachedplayer: block.player, icon:block.image)
                                .padding(.leading, 50)
                            Spacer()
                        }
                    }
                    //TODO remove the force unwrap above
                        
                }
            }
        }
    }
}

struct LayeredSoundView_Previews: PreviewProvider {
    static var previews: some View {
        LayeredSoundView()
    }
}


