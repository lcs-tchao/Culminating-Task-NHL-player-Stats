//
//  24-25SeasonStats.swift
//  Culminating Task NHL player Stats
//
//  Created by Yuk Yeung Chao on 2025-05-20.
//


import Foundation

struct LastGame: Codable, Identifiable {
    var id: Int { gameId } 
    
    let assists: Int
    let gameDate: String
    let gameId: Int
    let gameTypeId: Int
    let goals: Int
    let homeRoadFlag: String
    let opponentAbbrev: String
    let pim: Int
    let plusMinus: Int
    let points: Int
    let powerPlayGoals: Int
    let shifts: Int
    let shorthandedGoals: Int
    let shots: Int
    let teamAbbrev: String
    let toi: String          
}

struct PlayerLastGameStats: Codable, Identifiable {
    let id = UUID()
  
    let last5Games: [LastGame] // This connects the two models
}
