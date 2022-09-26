//
//  Prefrences.swift
//  RelaxApp
//
//  Created by william Vise on 20/8/2022.
//

import SwiftUI

struct OptionsView: View {
    @State var playbuttontoggle = UserDefaults.standard.bool(forKey: "playpos")
    @State var stoponhide = UserDefaults.standard.bool(forKey: "stoponhide")
    @StateObject var statem = globalstate
    let defaults = UserDefaults.standard
    var body: some View {
        VStack{
            ZStack {
                #if DEBUG
                VStack{
                    Text("").frame(width: 10, height: 100, alignment: .center)
                HStack{
                    Button("debug"){statem.currentscreen = .BuilltinSounds}
                    Spacer()
                }
                }
                #endif
            }
            VStack {
                HStack{
                    Text("Move the Play Button to be on the right side of the screen")
                        .font(.custom("VarelaRound-Regular", size: 20))
                        .foregroundColor(Colorassets.gear)
                    Spacer()
                    Toggle(isOn: $playbuttontoggle, label: {})
                        .padding(.trailing,50)
                        .onChange(of: playbuttontoggle) { value in
                            defaults.set(true, forKey: "checkconfig")
                            defaults.set(value, forKey: "playpos")
                            }

                }
                HStack{
                    Text("Pause Sounds when the app is hidden")
                        .font(.custom("VarelaRound-Regular", size: 20))
                        .foregroundColor(Colorassets.gear)
                    Spacer()
                    Toggle(isOn: $stoponhide, label: {})
                        .padding(.trailing,50)
                        .onChange(of: stoponhide) { value in
                            defaults.set(true, forKey: "checkconfig")
                            defaults.set(value, forKey: "stoponhide")
                            }

                }
                Spacer()
            }
            Spacer()
        }
    }
}

struct Prefrences_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView()
    }
}



