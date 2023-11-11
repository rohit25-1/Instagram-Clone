//
//  PostView.swift
//  InstagramClone
//
//  Created by Rohit Sridharan on 03/11/23.
//

import SwiftUI

struct PostView: View {
    @State var isLiked : Bool = false
    @State var isSaved : Bool = false
    var body: some View {
        VStack{
            HStack{
                Image("profilePhoto2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal)
                Text("rohit25-1")
                    .font(.headline)
                Spacer()
            }
            //Image Comes here
            Image("post")
                .onTapGesture(count: 2, perform: {
                    isLiked.toggle()
                })
            //
            HStack{
                HStack{
                    Button(action: {
                        isLiked.toggle()
                    }, label: {
                        ImageButton(sysName: isLiked ? "heart.fill" : "heart")
                            .symbolEffect(.bounce, value: isLiked)
                            .foregroundStyle(isLiked ? .red : .black)
                    })
                    
                    
                    Button(action: {}, label: {
                        ImageButton(sysName: "bubble.right")
                    })
                    Button(action: {}, label: {
                        ImageButton(sysName: "paperplane")
                    })
                    
                }.padding(.horizontal)
                
                Spacer()
                Button(action: {
                    isSaved.toggle()
                }, label: {
                    ImageButton(sysName: isSaved ? "bookmark.fill" : "bookmark")
                        .symbolEffect(.bounce, value: isSaved)
//                        .foregroundStyle(isSaved ? .green : .black)
                })
            }
            HStack{
                Text("1540 likes")
                    .font(.headline)
                    .padding(.horizontal,15)
                    .padding(.top,10)
                Spacer()
            }
            
            HStack{
                ExpandableText(initialText: "rohit25-1: is a test messa this is a test message.This is a test message this is a test message.This is a test message this is a test message.This is a test message this is a test message.This is").padding(.leading)
                Spacer()
            }.padding(.top,3)
        }
    }
}

#Preview {
    PostView()
}
