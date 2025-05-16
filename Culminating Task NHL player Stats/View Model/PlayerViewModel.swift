//
//  Player View.swift
//  Culminating Task NHL player Stats
//
//  Created by Yuk Yeung Chao on 2025-05-16.
//

import Foundation

@Observable
class PlayerViewModel {

    var currentPlayer: Player?

    var favouritePlayer: [Player] = []
    
 
    init(currentPlayer: Player? = nil) {

        self.currentPlayer = currentPlayer
        

        Task {
            await self.fetchPlayer()
        }
    }


    
    func fetchPlayer() async {

        let endpoint = "https://search.d3.nhle.com/api/v1/search/player?culture=en-us&limit=20&q=mcdavid"
        guard let url = URL(string: endpoint) else {
            print("Invalid address for JSON endpoint.")
            return
        }

        do {

            let (data, _) = try await URLSession.shared.data(from: url)

            print("Got data from endpoint, contents of response are:")
            print(String(data: data, encoding: .utf8)!)

            let decoder = JSONDecoder()
  
            let decodedData = try decoder.decode([Player].self, from: data)

            self.currentPlayer = decodedData.first!
            
        } catch {

            print("Count not retrieve data from endpoint, or could not decode into an instance of a Swift data type.")
            print("----")
 
            print(error)
            
        }
    }
    
}

