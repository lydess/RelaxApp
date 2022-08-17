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
            HStack {
                Text(noisetitle)
                    .font(.system(size: 30)).bold().padding([.leading,.top])
                Spacer()
                Text(String(duration))
                Text("Min")
                    .padding(.trailing)
            }
            HStack{
                Spacer()
                Button(action: {}, label: {Image(systemName: "chevron.right")})
                    .padding(.trailing)
            }
            Text(descripton)
                .multilineTextAlignment(.center)
                .padding([.top,.bottom])
        }.background(backcolor)
            .cornerRadius(25)
            .padding()
        
            
    }
}

struct NoiseBlock_Previews: PreviewProvider {
    static var previews: some View {
        NoiseBlock(backcolor: .red,noisetitle: "Brown noise",descripton: "Great for people with ADHD and Autism for quieting loud and chattering minds", duration: 60, image: Image(systemName: "cirlce"))
    }
}
