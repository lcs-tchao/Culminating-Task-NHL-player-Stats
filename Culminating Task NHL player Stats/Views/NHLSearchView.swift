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
                    NavigationLink(destination: PlayerInterfaceView(player: player)) {
                        Text(player.name)
                            .font(.headline)
                    }
                    // .listRowBackground(Color.clear) // Optional: make each row clear (sometimes helps)
                }
                .listStyle(.plain)
                .background(Color.clear) // <-- This lets your gradient show through
                .navigationBarItems(leading:
                    Image("NHL-logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 60)
                )
                .searchable(text: $viewModel.searchText)
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

