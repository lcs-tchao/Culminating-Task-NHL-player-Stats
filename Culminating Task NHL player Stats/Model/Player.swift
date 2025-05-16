//
//  Player.swift
//  Culminating Task NHL player Stats
//
//  Created by Yuk Yeung Chao on 2025-05-16.
//

import Foundation

struct Player: Identifiable, Codable {
    
    // MARK: Stored properties
    let id = UUID()
    let playerId: String
    let name: String
    let positionCode: String
    let teamId: String?  // Nullable for inactive players
    let teamAbbre: String?
    let lastTeamId: String?
    let lastTeamAbbre: String?
    let lastSeasonId: String?
    let sweaterNumber: Int?
    let active: Bool
    let height: String
    let heightInInches: Int
    let heightInCentimeters: Int
    let weightInPounds: Int
    let weightInKilograms: Int
    let birthCity: String
    let birthStateProvince: String?
    let birthCountry: String
    // MARK: Computed properties
    
}

// Create an example joke for testing purposes
let examplePlayer = Player (
    playerId: "8478402",
    name: "Connor McDavid",
    positionCode: "C",
    teamId: "22",
    teamAbbre: "EDM",
    lastTeamId: "22",
    lastTeamAbbre: "EDM",
    lastSeasonId: "20242025",
    sweaterNumber: 97,
    active: true,
    height: "6'1\"",
    heightInInches: 73,
    heightInCentimeters: 185,
    weightInPounds: 194,
    weightInKilograms: 87,
    birthCity: "Richmond Hill",
    birthStateProvince: "ON",
    birthCountry: "CAN"
)
