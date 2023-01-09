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
        if horizontalSizeClass == .compact {
            HStack {
                ForEach(globalstate.currentHeader.HeaderDetails ?? [HeaderItem]()) { currentbutton in
                    Spacer()
                    HeaderButton(HeaderData: currentbutton)
                    //TODO come up with a better way of fixing this responsiveness issue
                    //The deeeper issue is getting the size class to be available during initial startup before views are loaded, since size class isent known till viewload
                        .offset(x: currentbutton.HeaderType == .StaticTitle ? -40: 0)
                    Spacer()
                }
            }
        } else {
            HStack {
                ForEach(globalstate.currentHeader.HeaderDetails ?? [HeaderItem]()) { currentbutton in
                   Spacer()
                    HeaderButton(HeaderData: currentbutton)
                    Spacer()
                }
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
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @State var alertShown = false
    var ButtonSize = CGFloat(36)
    var textSize = CGFloat(29)
    var title = globalstate.currentDisplayedItem
    var id = UUID()
    var HeaderData:HeaderItem
    
    var body: some View {
        switch HeaderData.HeaderType {
        case .Filler:
            Rectangle().frame(width: 44, height: 44, alignment: .center)
                .foregroundColor(ColorAssets.mainback)
        case .StaticTitle:
            Text(HeaderData.text ?? "Relax")
                .font(.custom("VarelaRound-Regular.ttf", size: horizontalSizeClass == .compact ? textSize:textSize + 15))
                .foregroundColor(ColorAssets.textbleu)
        case .Transition:
            Button(action: HeaderData.transitionAction, label: {
                if HeaderData.image == Image(systemName: "chevron.left") {
                    HeaderData.image
                        .resizable()
                        .foregroundColor(ColorAssets.textbleu)
                        .frame(width: ButtonSize - (ButtonSize / 3), height: ButtonSize / 1.1, alignment: .center)
                } else {
                    HeaderData.image
                        .resizable()
                        .foregroundColor(ColorAssets.textbleu)
                        .frame(width: ButtonSize, height: ButtonSize, alignment: .center)
                }
            })
             
        case .TrackTitle:
            Text(globalstate.currentDisplayedItem.noisetitle)
                .font(.custom("VarelaRound-Regular.ttf", size: horizontalSizeClass == .compact ? textSize:textSize + 15))
                .foregroundColor(ColorAssets.textbleu)
        
        case .Alert:
            Button(action: {alertShown.toggle()}, label: {Image(systemName: "questionmark.circle")
                    .resizable()
                    .frame(width: ButtonSize, height: ButtonSize, alignment: .center)
                    .foregroundColor(ColorAssets.textbleu)
            })
                .alert("Tap the Symbols to add tracks, and Mix them to create your own soothing sound!", isPresented: $alertShown, actions: {})
                
        }
        
    }
    
}
