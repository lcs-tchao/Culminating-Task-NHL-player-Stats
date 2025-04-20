//
//  Overall view.swift
//  Culminating Task NHL player Stats
//
//  Created by Yuk Yeung Chao on 2025-04-20.
//

import SwiftUI

struct NHLSearchView: View {
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
            
            
            TextField("Search NHL players..", text: $searchText)
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(15)
                .padding(.horizontal)
                .padding(.bottom)

            Spacer()
            
            // Bottom Tab Bar
            HStack {
                Spacer()
                VStack {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                        .font(.caption)
                }
                Spacer()
                VStack {
                    Image(systemName: "star")
                    Text("Favourite")
                        .font(.caption)
                }
                Spacer()
                VStack {
                    Image(systemName: "clock")
                    Text("History")
                        .font(.caption)
                }
                Spacer()
            }
            .padding()
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 25))
        }
    }
}


#Preview {
    NHLSearchView()
}

