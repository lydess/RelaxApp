//
//  NoiseBlock.swift
//  RelaxApp
//
//  Created by william Vise on 15/8/2022.
//

import SwiftUI

struct NoiseBlock: View {
    var backcolor: Color
    var noisetitle: String
    var descripton: String
    var duration: Int
    var id = UUID()
    var image: Image
    var body: some View {
        VStack{
            ZStack{
            HStack {
                Text(noisetitle)
                    .font(.custom("VarelaRound-Regular", size: 28))
                    .padding()
                
                
            }
                VStack {
                    Spacer()
                    HStack{
                    Spacer()
        
                        
                    }
                    Spacer()
                }
                
            }
            
        }.background(backcolor)
            .cornerRadius(10)
            .padding()
        
            
    }
}

struct NoiseBlock_Previews: PreviewProvider {
    static var previews: some View {
        NoiseBlock(backcolor: .red,noisetitle: "Brown noise",descripton: "Great for people with ADHD and Autism for quieting loud and chattering minds", duration: 60, image: Image(systemName: "cirlce"))
    }
}
