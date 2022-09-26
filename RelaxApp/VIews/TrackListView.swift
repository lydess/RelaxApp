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
                TrackListScrollView()
           
            
           
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        TrackListView()
    }
}

