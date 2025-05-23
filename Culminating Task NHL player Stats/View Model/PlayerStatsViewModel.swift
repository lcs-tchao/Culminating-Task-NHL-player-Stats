//
//  PlayerStatsViewModel.swift
//  Culminating Task NHL player Stats
//
//  Created by Yuk Yeung Chao on 2025-05-16.
//

import Foundation

@Observable
class PlayerStatsViewModel {
    
    
    // MARK: Stored properties
    var currentPlayer: PlayerStats?
    var lastGameStats: PlayerLastGameStats?
    
    // MARK: Initializer(s)
    
    init(currentPlayerId: Int) {
        
        Task {
            await self.fetchPlayerStats(for: String("\(currentPlayerId)"))
            await self.fetchLastGameStats(for: String("\(currentPlayerId)"))
        }
    }
    
    
    // MARK: Fetch player main stats

    func fetchPlayerStats(for playerId: String) async {
        let endpoint = "https://api-web.nhle.com/v1/player/\(playerId)/landing"
        print("Trying to load results from this URL:")
        print(endpoint)
        guard let url = URL(string: endpoint) else {
            print("Invalid address for JSON endpoint.")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            print("Got data from endpoint, contents of response are:")
            print(String(data: data, encoding: .utf8) ?? "Unreadable data")

            let decoder = JSONDecoder()
            
            let decodedData = try decoder.decode(PlayerStats.self, from: data)
            
            self.currentPlayer = decodedData
            
            
        } catch {
            print("Count not retrieve data from endpoint, or could not decode into an instance of a Swift data type.")
            print("----")
        
            print(error)
        }
    }
    
    
    
    // MARK: Fetch last 5 games stats
    func fetchLastGameStats(for playerId: String) async {
        print("About to get last 5 games stats from endpoint:")
        let endpoint = "https://api-web.nhle.com/v1/player/\(playerId)/landing"
        print("\(endpoint)")
        guard let url = URL(string: endpoint) else {
            print("Invalid address for JSON endpoint.")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            print("Got data from endpoint, contents of response are:")
            print(String(data: data, encoding: .utf8) ?? "Unreadable data")

            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(PlayerLastGameStats.self, from: data)
            self.lastGameStats = decodedData
            
        } catch {
            print("Count not retrieve data from endpoint, or could not decode into an instance of a Swift data type.")
            print("----")
        
            print(error)
        }
    }
}
