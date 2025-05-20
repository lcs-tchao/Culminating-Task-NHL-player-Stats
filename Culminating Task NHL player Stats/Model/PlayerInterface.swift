//
//  Career Stats.swift
//  Culminating Task NHL player Stats
//
//  Created by Yuk Yeung Chao on 2025-05-16.
//

import Foundation


struct PlayerInterface: Identifiable, Codable {
    let id = UUID()
    
    let teamLogo: String
    let sweaterNumber: Int
    let position: String
    let headshot: String
    let heroImage: String
    let heightInInches: Int
    let heightInCentimeters: Int
    let weightInPounds: Int
    let weightInKilograms: Int
    let birthDate: String
    let birthCity: BirthCity
    let birthStateProvince: BirthStateProvince
    let birthCountry: String
    let shootsCatches: String
    let draftDetails: DraftDetails
}

struct DraftDetails: Codable {
    let year: Int
    let teamAbbrev: String
    let round: Int
    let pickInRound: Int
    let overallPick: Int
}

struct BirthCity: Codable {
    let `default`: String
}

struct BirthStateProvince: Codable {
    let `default`: String
}
