//
//  PlayerDetail.swift
//  Culminating Task NHL player Stats
//
//  Created by Yuk Yeung Chao on 2025-05-16.
//


import Foundation

struct RegularSeason: Codable{
    let subSeason: StatisticsLine
    let career: StatisticsLine
}

struct FeaturedStats: Codable {
    let season: Int
    let regularSeason: RegularSeason
}
struct StatisticsLine: Codable {
    let assists: Int
    let gameWinningGoals: Int
    let gamesPlayed: Int
    let goals: Int
    let otGoals: Int
    let pim: Int
    let plusMinus: Int
    let points: Int
    let powerPlayGoals: Int
    let powerPlayPoints: Int
    let shootingPctg: Double
    let shorthandedGoals: Int
    let shorthandedPoints: Int
    let shots: Int
}

struct FullTeamName: Codable {
    let english: String
    let french: String
    
    //provide ncoding and decoding hints when pulling data from endpoint
    enum CodingKeys: String, CodingKey {
        case english = "default"
        case french = "fr"
    }
}


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



struct PlayerStats: Identifiable, Codable {
    
    let id = UUID()
    let playerId: Int
    let isActive: Bool
    let currentTeamId: Int
    let currentTeamAbbrev: String
    let fullTeamName: FullTeamName
    let featuredStats: FeaturedStats

}

