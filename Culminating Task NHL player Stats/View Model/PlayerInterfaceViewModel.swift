//
//  Career Stats.swift
//  Culminating Task NHL player Stats
//
//  Created by Yuk Yeung Chao on 2025-05-16.
//


import Foundation


@Observable @MainActor
class PlayerInterfaceViewModel{
    
    // MARK: Stored properties
    

    var currentPlayer: PlayerInterface?

    var favouritePlayer: [PlayerInterface] = []
    
    // MARK: Initializer(s)
    init(currentPlayer: PlayerInterface? = nil) {
        self.currentPlayer = currentPlayer
    }
    
    
        func fetchPlayer(for playerId: String) async {
            
            // 1. Attempt to create a URL from the address provided
            let endpoint = "https://api-web.nhle.com/v1/player/\(playerId)/landing"
            guard let url = URL(string: endpoint) else {
                print("Invalid address for JSON endpoint.")
                return
            }

            do {
                
                let (data, _) = try await URLSession.shared.data(from: url)
                
          
                print("Got data from endpoint, contents of response are:")
                print(String(data: data, encoding: .utf8)!)
        
                let decoder = JSONDecoder()

                let decodedData = try decoder.decode(PlayerInterface.self, from: data)
      
                self.currentPlayer = decodedData
                
            } catch {
                
    
                print("Count not retrieve data from endpoint, or could not decode into an instance of a Swift data type.")
                print("----")
                
    
                print(error)
                
            }
        }
        
    }
