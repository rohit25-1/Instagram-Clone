//
//  FeedView.swift
//  InstagramClone
//
//  Created by Rohit Sridharan on 04/11/23.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                Divider()
                    .padding(.vertical)
                LazyVStack{
                    ForEach(0...15, id: \.self)
                    {index in
                        PostView()
                    }
                    
                }
            }
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "paperplane")
                                .tint(.black)
                        })
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            
                        }, label: {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 130, height: 130, alignment: .center)
                        })
                    }
                }
            
            
        }
        
    }
}

#Preview {
    FeedView()
}
