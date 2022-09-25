//
//  HomeView.swift
//  RelaxApp
//
//  Created by william Vise on 16/8/2022.
//

import SwiftUI



struct TrackListView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @StateObject var State = globalstate
    @StateObject var Gyro = Gyrostate
   
    
    let debug = BuiltinSounds()
    
    
    init() {
        UIScrollView.appearance().bounces = false
    
      }
    
    var body: some View {
        VStack {
                HStack{
                    Spacer()
                    Text("Tracks")
                            .font(.custom("VarelaRound-Regular", size: 26))
                            .onAppear(perform: {State.currentlist = debug.setuplist()})
                            .foregroundColor(Colorassets.gear)
                    Spacer()
                    Button(action: {
                        State.currentscreen = .Options
                    }, label: {Image(systemName: "gearshape")
                        .resizable()
                        .frame(width: 33, height: 33, alignment: .center)
                        .foregroundColor(Colorassets.gear)
                    }).buttonStyle(.plain)
                        .foregroundColor(Colorassets.silver)
                        .accessibilityLabel("Settings")
                        .padding(.trailing, 50)
                }.padding(.top, 50)
            
         
                TrackListScrollView()
           
            Spacer()
           
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        TrackListView()
    }
}

