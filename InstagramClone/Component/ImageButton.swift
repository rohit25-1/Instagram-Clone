//
//  ImageButton.swift
//  InstagramClone
//
//  Created by Rohit Sridharan on 04/11/23.
//

import SwiftUI

struct ImageButton: View {
    var sysName : String
    var body: some View {
        
        Image(systemName: sysName)
            .resizable()
            .scaledToFit()
            .frame(width: 25, height: 25, alignment: .center)
            .padding(.trailing,10)
            .tint(.black)
    }
}

#Preview {
    ImageButton(sysName: "heart")
}
