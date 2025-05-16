//
//  Search.swift
//  Culminating Task NHL player Stats
//
//  Created by Yuk Yeung Chao on 2025-05-16.
//

import Foundation

struct SearchUtility {
    static func filterPlayers(originalList: [Player], against searchText: String) -> [Player] {
        // If search is empty, return full list
        if searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return originalList
        }

        return originalList.filter { player in
            player.name.lowercased().contains(searchText.lowercased())
        }
    }
}
