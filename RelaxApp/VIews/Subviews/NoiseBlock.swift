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
    var textcolor:Color
    var descripton: String
    var id = UUID()
    var image: Image
    var fontsize: CGFloat
    var body: some View {
        VStack{
            ZStack{
            HStack {
                Text(noisetitle)
                    .font(.custom("VarelaRound-Regular", size: fontsize))
                    .padding()
                    .foregroundColor(textcolor)
                    .lineLimit(2)
                    
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
        NoiseBlock(backcolor: .red,noisetitle: "Brown noise", textcolor: Colorassets.gear,descripton: "Great for people with ADHD and Autism for quieting loud and chattering minds", image: Image(systemName: "cirlce"), fontsize: 28)
    }
}
