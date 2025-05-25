//
//  Player View.swift
//  Culminating Task NHL player Stats
//
//  Created by Yuk Yeung Chao on 2025-05-16.
//

import Foundation

@Observable @MainActor
class PlayerViewModel {
    
    var allPlayers: [Player] = []
    var filteredPlayers: [Player] = []
    var currentPlayer: Player?
    var favouritePlayer: [Player] = []
    
    
    
    
    var searchText: String = "" {
        didSet {
            filterPlayers()
        }
    }
    
    
    // MARK: Fetch from endpoint with search
    func fetchPlayer(playerName: String) async {
        let endpoint = "https://search.d3.nhle.com/api/v1/search/player?culture=en-us&limit=20&q=\(playerName)"
        guard let url = URL(string: endpoint) else {
            print("Invalid address for JSON endpoint.")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            print(String(data: data, encoding: .utf8) ?? "No data")

            let decoder = JSONDecoder()
            let decodedData = try decoder.decode([Player].self, from: data)

            // Update properties — @Observable tracks changes automatically
            self.allPlayers = decodedData
            self.filteredPlayers = decodedData
            self.currentPlayer = decodedData.first
        } catch {
            print("Could not retrieve data from endpoint, or could not decode into an instance of a Swift data type.")
            print("----")
            print(error)
        }
    }
    
    // MARK: Filter players for search
    func filterPlayers() {
        self.filteredPlayers = SearchUtility.filterPlayers(originalList: allPlayers, against: searchText)
    }
    
    // MARK: Save favourite players
    func saveFavoritePlayer() {
        guard let currentPlayer = self.currentPlayer else {
            print("⚠️ currentPlayer is nil")
            return
        }

        print("Trying to save: \(currentPlayer.name), ID: \(currentPlayer.id)")
        print("Current favourites: \(favouritePlayer.map { $0.name })")

        if !favouritePlayer.contains(where: { $0.id == currentPlayer.id }) {
            favouritePlayer.insert(currentPlayer, at: 0)
            print("✅ Added \(currentPlayer.name) to favourites.")
        } else {
            print("ℹ️ \(currentPlayer.name) is already in favourites.")
        }

        print("✅ There are \(favouritePlayer.count) favourite players saved.")
    }

}
