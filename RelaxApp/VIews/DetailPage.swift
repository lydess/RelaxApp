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
    @StateObject var statem = globalstate
    @State var doshow = false
    @State var Audioisconfigured = false
    var pview = ProgressView(value: 0.5)
    var block:MenuBlocks
    
    var time = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack{
            VStack{
                Text(block.noisetitle).font(.headline)
                    .padding()
                HStack{Button("<"){
                    
                    statem.currentscreen = 0}}
                Text(block.descripton).font(.body)
                    .padding()
                block.image
                if statem.isplaying {
                    Button("Play"){}
                } else {
                    Button("Play"){}
                }
                Spacer()
                
            }

        }
    }
}

struct DetailPage_Previews: PreviewProvider {
    static var previews: some View {
        DetailPage(block: MenuBlocks(backcolor: .red, noisetitle: "Title", descripton: "Desc", duration: 50, id: UUID(), sound: .tada, savedtime: 0.0))
    }
}
