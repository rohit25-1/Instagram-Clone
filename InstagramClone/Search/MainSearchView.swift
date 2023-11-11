//
//  MainSearchView.swift
//  InstagramClone
//
//  Created by Rohit Sridharan on 10/11/23.
//

import SwiftUI

struct MainSearchView: View {
    @State var searchText: String = ""
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    ForEach(0...15, id: \.self)
                    {_ in
                        SearchUserView(profilePhoto: "profilePhoto2", userName: "rohit25-1", fullName: "Rohit Sridharan")
                    }
                    
                    
                }.listRowSeparatorTint(.brown)
                .searchable(text: $searchText, placement: .automatic, prompt: "Search")
                .navigationTitle("Search")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
       
    }
}

#Preview {
    MainSearchView()
}
