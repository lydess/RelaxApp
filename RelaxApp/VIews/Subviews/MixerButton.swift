//
//  MixerButton.swift
//  RelaxApp
//
//  Created by william Vise on 20/9/2022.
//

import SwiftUI
import AVKit

struct MixerButton: View {
    var attachedplayer: AVAudioPlayer
    var icon:Image
    var name: String
    @State private var offsetval = 0
    @State private var opacval = 0.0
    @State private var Active = false
    @State private var slider = 1.0
    @State private var isedditng = false
    
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
                                
                            Text(name)
                                .lineLimit(2)
                                .multilineTextAlignment(.leading)
                                .offset(x: 0, y: -10)
                                
                        }
                        .frame(width: 100, height: 55, alignment: .center)
                        
                        
                       
                            Image(systemName: "playpause.fill").resizable().frame(width: 11, height: 11, alignment: .center).foregroundColor(Active ? .green:.gray).padding(.bottom,10)
                              
                                .offset(x: CGFloat(offsetval))
                                .opacity(opacval)
                        
                            
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
    
}


