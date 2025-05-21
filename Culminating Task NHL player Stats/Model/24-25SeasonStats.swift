//
//  24-25SeasonStats.swift
//  Culminating Task NHL player Stats
//
//  Created by Yuk Yeung Chao on 2025-05-20.
//


import Foundation

struct FeaturedStatsCurrentSeason: Codable {
    let season: Int
    let regularSeason: RegularSeasonStats
}

struct RegularSeasonStats: Codable {
    let subSeason: CurrentSeasonStats
}

struct CurrentSeasonStats: Codable {
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
