//
//  Landing View.swift
//  Culminating Task NHL player Stats
//
//  Created by Yuk Yeung Chao on 2025-04-20.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        TabView {
            NHLSearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .tag(1)
            
            FavouritePlayersView()
                .tabItem {
                    Image(systemName: "star")
                    Text("Favourite")
                }
                .tag(2)
        }
    }
}

#Preview {
    LandingView()
        .environment(PlayerViewModel())
}



