//
//  DetailViewModel.swift
//  Culminating Task NHL player Stats
//
//  Created by Yuk Yeung Chao on 2025-05-16.
//

import Foundation


@Observable
class PlayerViewModelDetail {
    

    var currentPlayer: PlayerDetail?
    

    var favouritePlayer: [PlayerDetail] = []

    init(currentPlayer: PlayerDetail? = nil) {
        

        self.currentPlayer = currentPlayer

        Task {
            await self.fetchPlayer()
        }
    }

    
    func fetchPlayer() async {

        let endpoint = "https://api-web.nhle.com/v1/player/8478402/landing"
        guard let url = URL(string: endpoint) else {
            print("Invalid address for JSON endpoint.")
            return
        }

        do {
       
            let (data, _) = try await URLSession.shared.data(from: url)
            

            print("Got data from endpoint, contents of response are:")
            print(String(data: data, encoding: .utf8)!)
   
            let decoder = JSONDecoder()
 
            let decodedData = try decoder.decode([PlayerDetail].self, from: data)
            

            self.currentPlayer = decodedData.first!
            
        } catch {
            

            print("Count not retrieve data from endpoint, or could not decode into an instance of a Swift data type.")
            print("----")

            print(error)
            
        }
    }
    
}
