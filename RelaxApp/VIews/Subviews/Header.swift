//
//  Header.swift
//  RelaxApp
//
//  Created by william Vise on 26/9/2022.
//

import SwiftUI

struct Header: View {
    @StateObject var State = globalstate
    var buttonlist = builtinStructs(Statecontext: globalstate).buttons
    @State var showsheet = false
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @State var currentbuttons = [HeaderButton]()
    var body: some View {
        HStack {
            ForEach(buttonlist) { currentbutton in
                currentbutton
            }
            
        }.background(.red)

            
    }

       
    
    }
    


struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
