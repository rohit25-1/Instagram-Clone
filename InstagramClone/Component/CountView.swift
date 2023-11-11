//
//  CountView.swift
//  InstagramClone
//
//  Created by Rohit Sridharan on 02/11/23.
//

import SwiftUI

struct CountView: View {
    var count : Int
    var text : String
    var body: some View {
        VStack{
            Text("\(count)")
                .font(.subheadline)
                .fontWeight(.bold)
            Text(text)
                .font(.footnote)
                .fontWeight(.bold)
        }.frame(width: 80, height: 60, alignment: .center)
    }
}

#Preview {
    CountView(count: 2, text: "Followers")
}
