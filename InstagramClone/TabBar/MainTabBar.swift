//
//  MainTabBar.swift
//  InstagramClone
//
//  Created by Rohit Sridharan on 02/11/23.
//

import SwiftUI

struct MainTabBar: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "house");
                }
            
            MainSearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass");
                }
            
            Text("Post")
                .tabItem {
                    Image(systemName: "plus.square");
                }
            
            Text("Likes")
                .tabItem {
                    Image(systemName: "heart");
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person");
                }
        }.tint(.black)
    }
}

#Preview {
    MainTabBar()
}
