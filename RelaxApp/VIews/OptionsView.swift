//
//  Prefrences.swift
//  RelaxApp
//
//  Created by william Vise on 20/8/2022.
//

import SwiftUI

struct OptionsView: View {
    @State var playbuttontoggle = false
    @StateObject var statem = globalstate
    let defaults = UserDefaults.standard
    var body: some View {
        VStack{
            ZStack {
                HStack{
                    Button("debug"){statem.currentscreen = .Debug}
                    Spacer()
                }
                HStack {
                    Spacer()
                    Button("Save Changes"){
                        defaults.set(true, forKey: "checkconfig")
                        defaults.set(playbuttontoggle, forKey: "playpos")
                        statem.currentscreen = .HomeScreen
                    }
                    Button("Exit without saving"){
                        statem.currentscreen = .HomeScreen
                    }
                    Spacer()
                }.padding(.bottom,40)
            }
            VStack {
                Text("Settings")
                HStack{
                    Text("Play Button on the right side of the screen").padding()
                    Spacer()
                    Toggle(isOn: $playbuttontoggle, label: {})
                        .padding(.trailing,50)
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



