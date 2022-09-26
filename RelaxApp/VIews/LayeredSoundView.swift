//
//  LayeredSoundView.swift
//  RelaxApp
//
//  Created by william Vise on 20/9/2022.
//

import SwiftUI
var gsd = globalstate
struct LayeredSoundView: View {
    @StateObject var statem = globalstate
    @State var showHelpSheet = false
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        VStack {
            statem.currentDisplayedItem.image?
                .resizable()
                .frame(width: horizontalSizeClass == .compact ? 300 : UIScreen.main.bounds.width - 200, height: 300, alignment: .center)
                .padding(.top, horizontalSizeClass == .compact ? 0 : 10)
                .offset(x: 0, y: horizontalSizeClass == .regular ?  -300 : 0)
            
            HStack {
                Button("Stop Sounds"){
                    for x in statem.activemixers {
                        x.Active = false
                    }
                }
                Text("sounds")
                    .font(.custom("VarelaRound-Regular", size: 20))
                    .foregroundColor(Colorassets.gear)
                    .padding(.leading , horizontalSizeClass == .compact ? 10 : 50)
                    .offset(x: 20, y: 0)
                Spacer()
            }
            VStack{
                ForEach(statem.activemixers, id: \.self){ block in
                    VStack {
                        HStack {
                            block
                            Spacer()
                        }
                    }
                }
                
            }
            Spacer()
        }
    }
}

struct LayeredSoundView_Previews: PreviewProvider {
    static var previews: some View {
        LayeredSoundView()
    }
}


