//
//  Header.swift
//  RelaxApp
//
//  Created by william Vise on 26/9/2022.
//

import SwiftUI

struct Header: View {
    @StateObject var State = globalstate
    
    var title: String
    var backbuttonshown: Bool
    var settingsbuttonshown: Bool
    var helpbuttonshown: Bool
    @State var showsheet = false
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @State var buttonlist = builtinStructs(Statecontext: globalstate)
    var body: some View {
        VStack{
            
        HStack{
            
            if backbuttonshown == true {
                Button(action: {State.currentscreen = .HomeScreen}, label: {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .foregroundColor(Colorassets.gear)
                        .frame(width: 17, height: 25, alignment: .center)
                        .padding(.leading, 20)
                    
                })
            } else {
                Rectangle()
                    .frame(width: 22, height: 30, alignment: .center)
                    .foregroundColor(Colorassets.header)
            }
            Spacer()
            VStack{
                
                Text(title)
                    .font(.custom("VarelaRound-Regular", size: 28))
                    .foregroundColor(Colorassets.gear)
                
            }
            Spacer()
            if settingsbuttonshown == true {
                Button(action: {State.currentscreen = .Options}, label: {
                    Image(systemName: "gearshape.circle")
                        .resizable()
                        .foregroundColor(Colorassets.gear)
                        .frame(width: 33, height: 33, alignment: .center)
                        .padding(.trailing, 20)
                    
                })
            } else if helpbuttonshown == false {
                Rectangle()
                    .frame(width: 33, height: 33, alignment: .center)
                    .foregroundColor(Colorassets.header)
            }
            if helpbuttonshown {
                if horizontalSizeClass == .compact {
                    Button(action: {showsheet.toggle()}, label: {Image(systemName: "questionmark.circle.fill")
                            .resizable()
                            .frame(width: 33, height: 33, alignment: .center)
                            .foregroundColor(Colorassets.gear)
                            .padding(.trailing, 20)
                        
                    })
                    .sheet(isPresented: $showsheet, content: {
                        ZStack {
                            Rectangle().frame(width: UIScreen.main.bounds.width + 30, height: UIScreen.main.bounds.height + 30, alignment: .center).foregroundColor(Colorassets.header)
                            VStack {
                                Text("Select the Sounds you wish to add to the track, you can then further adjust how that track should play")
                                    .padding([.trailing,.leading], 50)
                                    .font(.custom("VarelaRound-Regular", size: 18))
                            }
                            
                        }
                        
                        .presentationDetents([.height(UIScreen.main.bounds.height / 7)])
                        
                        
                        
                    }
                    )
                }
            }
        }
        .frame(width: UIScreen.main
            .bounds.width, height: 50)
        .padding(.top, 30)
        .padding(.bottom, 20)
        .background(Colorassets.header)
            
    }
       
    
    }
    
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(title: "debug", backbuttonshown: true, settingsbuttonshown: true, helpbuttonshown: false)
    }
}
