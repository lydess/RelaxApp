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
    @State private var showvol = false
    @State private var slider = 1.0
    @State private var isedditng = false
    
    var body: some View {
        VStack {
            
            
            Button(action: {
                if showvol {
                    showvol.toggle()
                    attachedplayer.pause()
                } else {
                    showvol.toggle()
                    attachedplayer.play()
                }
                
            }, label: {
                ZStack{
                    icon.resizable()
                        .frame(width: 55, height: 55, alignment: .center)
                    Image(systemName: "playpause.fill").resizable().frame(width: 11, height: 11, alignment: .center).foregroundColor(showvol ? .green:.gray).padding(.bottom,10)
                }
                    
                    
            })
            .padding(.bottom, 30)
            if showvol {
                ZStack {
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
                    
                    
                    .rotationEffect(Angle(degrees: -90))
                    .frame(width: 100, height: 30, alignment: .center)
                    
                    Text("\(Int(slider * 100))")
                        .padding(.leading,50)
                }
                
            } else {
                Rectangle().frame(width: 150, height: 90, alignment: .center)
                    .foregroundColor(.clear)
                    .background(.clear)
            }
        }
    }
    
}


