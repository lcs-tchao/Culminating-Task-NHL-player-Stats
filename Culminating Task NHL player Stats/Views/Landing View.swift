//
//  Landing View.swift
//  Culminating Task NHL player Stats
//
//  Created by Yuk Yeung Chao on 2025-04-20.
//

import SwiftUI


struct LandingView: View {
    var body: some View {
        TabView(selection: Binding.constant(1)) {
              
                NHLSearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.blue)
                        Text("Search")
                            .font(.caption)
                            .foregroundColor(.blue)
                    }
                    .tag(1)
                
            FavouritePlayersView()
                    .tabItem {
                        VStack {
                            Image(systemName: "star")
                                .foregroundColor(.blue)
                            Text("Favourite")
                                .font(.caption)
                                .foregroundColor(.blue)
                        }
                        .tag(2)
                    }
           
            
        }
    
    }
}
                   

#Preview {
    LandingView()
}
