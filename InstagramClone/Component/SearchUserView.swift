//
//  SearchUserView.swift
//  InstagramClone
//
//  Created by Rohit Sridharan on 10/11/23.
//

import SwiftUI

struct SearchUserView: View {
    var profilePhoto : String
    var userName : String
    var fullName : String
    var body: some View {
        HStack{
            Image(profilePhoto)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .padding(.trailing,3)
            VStack{
                HStack{
                    Text(userName)
                        .font(.headline)
                    Spacer()
                }
                HStack{
                    Text(fullName)
                    Spacer()
                }
                
            }

        }
    }
}
