//
//  Favourite View.swift
//  Culminating Task NHL player Stats
//
//  Created by Yuk Yeung Chao on 2025-04-20.
//


import SwiftUI

struct NHLFavouriteView: View {
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            // NHL Logo and Title
            HStack {
                Image("NHL-logo")
                    .resizable()
                    .frame(width: 120, height: 60)
                     Spacer()
                
            }
            
            
            TextField("Search Favourite players..", text: $searchText)
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(15)
                .padding(.horizontal)
                .padding(.bottom)


             RoundedRectangle(cornerRadius: 25)
                .foregroundColor(Color(.systemGray4))
                .padding()
       
        }
    }
}

#Preview {
    NHLFavouriteView()
}
