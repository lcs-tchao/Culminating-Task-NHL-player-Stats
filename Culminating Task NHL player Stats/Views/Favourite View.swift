//
//  Favourite View.swift
//  Culminating Task NHL player Stats
//
//  Created by Yuk Yeung Chao on 2025-04-20.
//

import SwiftUI

struct FavouritePlayersView: View {
    @Environment(PlayerViewModel.self) var viewModel

    var body: some View {
        NavigationStack {
            ZStack {
                // Gradient background replaces plain color
                LinearGradient(
                    colors: [Color.white, Color.orange, Color.blue],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack {
                    if viewModel.favouritePlayer.isEmpty {
                        ContentUnavailableView(
                            "No favourite players",
                            systemImage: "star.slash",
                            description: Text("Add some players to your favourites to see them here.")
                        )
                    } else {
                        List(viewModel.favouritePlayer, id: \.id) { player in
                            NavigationLink(destination: PlayerInterfaceView(player: player)) {
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(player.name)
                                        .font(.headline)
                                    
                                    Text("\(player.positionCode)  #\(player.sweaterNumber ?? 0)")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                            }
                            .swipeActions {
                                Button(role: .destructive) {
                                    withAnimation {
                                        if let index = viewModel.favouritePlayer.firstIndex(where: { $0.id == player.id }) {
                                            viewModel.favouritePlayer.remove(at: index)
                                        }
                                    }
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        }
                        .listStyle(.plain)
                    }
                }
                .navigationTitle("Favourite Players")
            }
        }
    }
}

#Preview {
    FavouritePlayersView()
        .environment(PlayerViewModel())
}

