//
//  DetailPage.swift
//  RelaxApp
//
//  Created by william Vise on 16/8/2022.
//

import SwiftUI
import AVKit
struct DetailPage: View {
    var audiohandle = AudioHandler()
    var player: AVAudioPlayer?
    @State var doshow = false
    
    var block:MenuBlocks
    var body: some View {
        HStack{
            Button(action: {print("tap")},
                   label: {Image(systemName: "gearshape.fill")})
            Button(action: {doshow.toggle()},
                   label: {Image(systemName: "playpause.fill")})
            Button(action: {print("tap")},
                   label: {Image(systemName: "stop.fill")})
            
            if doshow {ProgressView().task {
                
                audiohandle.Play().play()
            }}
        }
    }
}

struct DetailPage_Previews: PreviewProvider {
    static var previews: some View {
        DetailPage(block: MenuBlocks(backcolor: .red, noisetitle: "Title", descripton: "Desc", duration: 50, id: UUID()))
    }
}
