//
//  Overall view.swift
//  Culminating Task NHL player Stats
//
//  Created by Yuk Yeung Chao on 2025-04-20.
//

import SwiftUI

struct NHLSearchView: View {
    @State var viewModel = PlayerViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.filteredPlayers) { player in
                Text(player.name)
            }
            .navigationBarItems(leading:
                Image("NHL-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 60)
            )
            .searchable(text: $viewModel.searchText)
            // This runs whenever the searchText changes
            .onChange(of: viewModel.searchText) { oldValue, newValue in
                Task {
                    await viewModel.fetchPlayer(playerName: viewModel.searchText)
                }
            }
        }
    }
}




#Preview {
    NHLSearchView()
}

