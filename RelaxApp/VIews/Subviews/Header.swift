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
        if HeaderData.isButton {
            Button(action: {
                HeaderData.transitionAction()
                
            }, label: {HeaderData.image.resizable()})
                .frame(width: ButtonSize, height: ButtonSize, alignment: .center)
                //.padding(EdgeInsets(top: 0, leading: 17, bottom: 0, trailing: 17))
        } else {
            Text(HeaderData.text)
                .font(.custom("VarelaRound-Regular", size: textSize))
                .foregroundColor(ColorAssets.gear)
        }
        
    }
    
}
