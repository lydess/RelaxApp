//
//  DetailPage.swift
//  RelaxApp
//
//  Created by william Vise on 16/8/2022.
//

import SwiftUI

struct DetailPage: View {
    var audiohadler = AudioHandler()
    var block:MenuBlocks
    var body: some View {
        HStack{
            Button(action: {print("tap")},
                   label: {Image(systemName: "gearshape.fill")})
            Button(action: {audiohadler.debugplayer()},
                   label: {Image(systemName: "playpause.fill")})
            Button(action: {print("tap")},
                   label: {Image(systemName: "stop.fill")})
        }
    }
}

struct DetailPage_Previews: PreviewProvider {
    static var previews: some View {
        DetailPage(block: MenuBlocks(backcolor: .red, noisetitle: "Title", descripton: "Desc", duration: 50, id: UUID()))
    }
}
