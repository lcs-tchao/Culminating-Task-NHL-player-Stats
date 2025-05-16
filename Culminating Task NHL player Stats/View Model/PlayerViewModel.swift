//
//  Player View.swift
//  Culminating Task NHL player Stats
//
//  Created by Yuk Yeung Chao on 2025-05-16.
//

import Foundation

@Observable
class PlayerViewModel {
    
    // List of all fetched players, can be used for filtering
    var allPlayers: [Player] = []
    // Filtered list for search
    var filteredPlayers: [Player] = []
    // for current player detailed
    var currentPlayer: Player?
    
    // Holds a list of favourite players
    var favouritePlayer: [Player] = []

    var searchText: String = "" {
        didSet {
            filterPlayers()
        }
    }
    
    
    
    // MARK: Fetch from endpoint with search
    
    // Runs a search based on the playerName that was received
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

            self.allPlayers = decodedData
            self.filteredPlayers = decodedData
            self.currentPlayer = decodedData.first
                       
   
           
            
        } catch {
            
            // Show an error that we wrote and understand
            print("Count not retrieve data from endpoint, or could not decode into an instance of a Swift data type.")
            print("----")
            
            // Show the detailed error to help with debugging
            print(error)
            
        }
    }
    
    func filterPlayers() {
        self.filteredPlayers = SearchUtility.filterPlayers(originalList: allPlayers, against: searchText)
      }
    // save favourite players
    
    func saveFavoritePlayer() {
        // Save current player
        if let currentPlayer = self.currentPlayer {
            // Insert the current player at the beginning of the favorite players list
            favouritePlayer.insert(currentPlayer, at: 0)
        }

        // How many saved players are there now?
        print("There are \( favouritePlayer.count) favorite players saved.")
    }
    
}
