//
//  Favourite View.swift
//  Culminating Task NHL player Stats
//
//  Created by Yuk Yeung Chao on 2025-04-20.
//


import SwiftUI

struct FavouritePlayersView: View {
    
    // Access the PlayerViewModel from environment
    @Environment(PlayerViewModel.self) var viewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background color (customize if you want)
                Color(.systemBackground)
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
                            VStack(alignment: .leading, spacing: 5) {
                                Text(player.name)
                                    .font(.headline)
                                Text("\(player.positionCode) — #\(player.sweaterNumber)")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            .padding(.vertical, 5)
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

