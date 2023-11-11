//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Rohit Sridharan on 02/11/23.
//

import SwiftUI

struct ProfileView: View {
    var GridVariable : [GridItem] = [
        .init(.flexible(), spacing:1),
        .init(.flexible(), spacing:1),
        .init(.flexible(), spacing:1),
    ]
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Image("profilePhoto2")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80, alignment: .center)
                        .clipShape(Circle())
                        .overlay(Circle().stroke().foregroundStyle(.gray))
                        .padding()
                    Spacer()
                    HStack{
                        CountView(count: 3, text: "Posts")
                        CountView(count: 12, text: "Followers")
                        CountView(count: 24, text: "Following")
                    }.padding()
                }
                
                VStack{
                    Text("Rohit Sridharan")
                        .frame(maxWidth:.infinity, alignment: .leading)
                        .padding(.horizontal)
                        .font(.callout)
                        .fontWeight(.medium)
                }
                
                Button {
                    
                } label: {
                    Text("Edit Profile")
                        .font(.headline)
                        .fontDesign(.rounded)
                        .foregroundStyle(.black)
                        .frame(width: 360, height: 32)
                        .overlay(RoundedRectangle(cornerRadius: 6).stroke(.gray))
                }
                
                HStack{
                    Spacer()
                    Image(systemName: "squareshape.split.3x3")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20, alignment: .center)
                    Spacer()
                }.padding(.vertical)
                
                ScrollView{
                    LazyVGrid(columns: GridVariable, spacing: 1) {
                        ForEach(0...15, id: \.self)
                        {index in
                            Image("post")
                                .resizable()
                                .scaledToFit()
                        }
                        
                    }
                }
                
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                            .tint(.black)
                    })
                }
            }
        }
        
    }
}

#Preview {
    ProfileView()
    
}
