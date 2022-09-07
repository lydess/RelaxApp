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
                HStack{
                    Button("debug"){statem.currentscreen = .Debug}
                    Spacer()
                }
                #endif
            }
            VStack {
                HStack {
                    Button(action: {statem.currentscreen = .HomeScreen}, label: {Image(systemName: "chevron.left")})
                        .padding()
                    Spacer()
                    Text("Settings")
                        .font(.custom("VarelaRound-Regular.ttf", size: 21))
                        .offset(x: -20, y: 0)
                    .foregroundColor(Colorassets.gear)
                    Spacer()
                }
                   
                HStack{
                    Text("move the Play Button to be on the right side of the screen").padding()
                    Spacer()
                    Toggle(isOn: $playbuttontoggle, label: {})
                        .padding(.trailing,50)
                        .onChange(of: playbuttontoggle) { value in
                            defaults.set(true, forKey: "checkconfig")
                            defaults.set(value, forKey: "playpos")
                            }

                }
                HStack{
                    Text("Pause Sounds when the app is hidden").padding()
                    Spacer()
                    Toggle(isOn: $stoponhide, label: {})
                        .padding(.trailing,50)
                        .onChange(of: stoponhide) { value in
                            defaults.set(true, forKey: "checkconfig")
                            defaults.set(value, forKey: "stoponhide")
                            }

                }
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



