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
    
    private var gridconfig = GridItem(.fixed(100), spacing: 10, alignment: .center)
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
            VStack{
                ForEach(statem.BackgroundPlayers, id: \.self){ block in
                    VStack {
                        MixerButton(attachedplayer: block.player, icon:block.image)
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


