//
//  DebugView.swift
//  RelaxApp
//
//  Created by william Vise on 19/8/2022.
//

import SwiftUI

struct DebugView: View {
    @StateObject var  statem = globalstate
    @State var anim = false
    @State var slide = 0.0
    	var dbtest = RDB
    let defaults = UserDefaults.standard

    var body: some View {
        Grid{
            
            GridRow{
                Spacer()
                Button("DBtestadd"){dbtest.testadd()}
                Spacer()
                Button("DBtestread"){dbtest.testread()}
                Spacer()
                Button("DBtestPath"){dbtest.findpath()}
                Spacer()
            }
        
            GridRow{
                Spacer()
                Button("DBtestEncode"){try! dbtest.testFullSoundTest()}
                Spacer()
                Spacer()
                Button("DBtestclear"){dbtest.cleardb()}
                Spacer()
            }
            
            
            
        }
        
        
    }
}

struct DebugView_Previews: PreviewProvider {
    static var previews: some View {
        DebugView()
    }
}
