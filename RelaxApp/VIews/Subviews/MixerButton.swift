//
//  MixerButton.swift
//  RelaxApp
//
//  Created by william Vise on 20/9/2022.
//

import SwiftUI
import AVKit

struct MixerButton: View, Hashable, Equatable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func ==(lhs: MixerButton, rhs: MixerButton) -> Bool {
        return lhs.name == rhs.name && lhs.id == rhs.id
    }
    
    @State var attachedplayer: AVAudioPlayer
    var icon:Image
    var name: String
    var id: UUID
    @State private var offsetval = 0
    @State private var opacval = 0.0
    @State var Active = false
    @State private var slider = 1.0
    @State private var isedditng:Bool? = false
    @State private var statem = globalstate
    
    
    var body: some View {
        HStack {
            VStack {
                Button(action: {
                    if Active {
                        Active.toggle()
                        attachedplayer.pause()
                        withAnimation{offsetval = 0 }
                        withAnimation{opacval = 0.0}
                       
                        
                    } else {
                        print(statem.currentDisplayedItem)
                        Active.toggle()
                        withAnimation{offsetval = -50 }
                        withAnimation{opacval = 1.0}
                        attachedplayer.play()
                        
                       
                    }
                    
                }, label: {
                    ZStack{
                        
                        VStack {
                            icon.resizable()
                                .frame(width: 55, height: 55, alignment: .center)
                                .foregroundColor(Active ? ColorAssets.green : ColorAssets.gear)
                                
                            Text(name)
                                .lineLimit(2)
                                .multilineTextAlignment(.leading)
                                .offset(x: 0, y: -10)
                                .font(.custom("VarelaRound-Regular", size: 16))
                                .foregroundColor(.black)
                                
                        }
                        .frame(width: 100, height: 55, alignment: .center)
                        
                        
                       
                        
                        
                            
                    }
                    .padding(.bottom, 30)
                        
                        
                })
                
                
            }
            if Active {
               
                    Slider(
                                value: $slider,
                                in: 0...1,
                                onEditingChanged: { editing in
                                    isedditng = editing
                                    
                                }
                    ).onChange(of: slider) { newValue in
                        attachedplayer.volume = Float(slider)
                        print("vol adjusted to \(slider)")
                    }
                    .frame(width: 100, height: 55)
                    
                
                
                
            }
        }
    }
    func turnoff() {
        self.Active = false
    }
}


