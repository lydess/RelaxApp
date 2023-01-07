//
//  Header.swift
//  RelaxApp
//
//  Created by william Vise on 26/9/2022.
//

import SwiftUI

struct Header: View {
    @StateObject var State = globalstate
    @State var showsheet = false
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @State var currentbuttons = [HeaderButton]()
    @State var CurrentText = ""
    var body: some View {
        HStack {
            ForEach(globalstate.currentHeader.HeaderDetails ?? [HeaderItem]()) { currentbutton in
                Spacer()
                HeaderButton(HeaderData: currentbutton)
                    
                    .offset(x: currentbutton.HeaderType == .StaticTitle ? 35: 0)
                Spacer()
            }
        }
    }
    }
    
struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}

struct HeaderButton:View, Identifiable {
    var ButtonSize = CGFloat(36)
    var textSize = CGFloat(40)
    var title = globalstate.currentDisplayedItem
    var id = UUID()
    var HeaderData:HeaderItem
    
    var body: some View {
        switch HeaderData.HeaderType {
        case .Filler:
            Rectangle().frame(width: 44, height: 44, alignment: .center)
                .foregroundColor(.red)
        case .StaticTitle:
            Text(HeaderData.text ?? "Relax")
                .font(.custom("VarelaRound-Regular.ttf", size: 29))
                .foregroundColor(ColorAssets.textbleu)
        case .Button:
            Button(action: HeaderData.transitionAction, label: {
                HeaderData.image
                .resizable()
                .foregroundColor(ColorAssets.textbleu)
                .frame(width: ButtonSize, height: ButtonSize, alignment: .center)
            })
                .offset(x: HeaderData.HeaderPosition == .Right ? 18:0)
        case .TrackTitle:
            Text(HeaderData.text ?? "Relax")
                .font(.custom("VarelaRound-Regular.ttf", size: 29))
                .foregroundColor(ColorAssets.textbleu)
        }
        
    }
    
}
