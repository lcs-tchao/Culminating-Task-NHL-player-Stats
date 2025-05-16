//
//  Detail View.swift
//  Culminating Task NHL player Stats
//
//  Created by Yuk Yeung Chao on 2025-04-20.
//

import SwiftUI
struct PlayerDetailView: View {
    
    // MARK: Stored properties
    let player: Player
    @State var viewModelDetail = PlayerDetailViewModel()
    
    
    // MARK: Computed properties
    var body: some View {
        VStack {
            
            // Show a joke if one exists
            if let currentPlayer = viewModelDetail.currentPlayer {
                
                Group {
                    Text(currentPlayer.fullTeamName.english)
                    Text(currentPlayer.fullTeamName.french)
                    Text("Assists: \(currentPlayer.featuredStats.regularSeason.career.assists)")
                    Text("Game Winning Goals: \(currentPlayer.featuredStats.regularSeason.career.gameWinningGoals)")
                    Text("Games Played: \(currentPlayer.featuredStats.regularSeason.career.gamesPlayed)")
                    Text("Goals: \(currentPlayer.featuredStats.regularSeason.career.goals)")
                    Text("Ot Goals: \(currentPlayer.featuredStats.regularSeason.career.otGoals)")
                    Text("Pim: \(currentPlayer.featuredStats.regularSeason.career.pim)")
                    Text("Plus Minus: \(currentPlayer.featuredStats.regularSeason.career.plusMinus)")
                    Text("Points: \(currentPlayer.featuredStats.regularSeason.career.points)")
                    Text("Power Play Goals: \(currentPlayer.featuredStats.regularSeason.career.powerPlayGoals)")
                    Text("Power Play Points: \(currentPlayer.featuredStats.regularSeason.career.powerPlayPoints)")
                    Text("Shooting Percentage: \(currentPlayer.featuredStats.regularSeason.career.shootingPctg)")
                    Text("Short handed Goals: \(currentPlayer.featuredStats.regularSeason.career.shorthandedGoals)")
                    Text("Short handed points: \(currentPlayer.featuredStats.regularSeason.career.shorthandedPoints)")
                    Text("Shots: \(currentPlayer.featuredStats.regularSeason.career.shots)")
                    
                }
                    
                        .font(.title)
                        .multilineTextAlignment(.center)
                
                
            }
        }
        .task {
                   await viewModelDetail.fetchPlayer(for: player.playerId)
               }
    }
}

#Preview {
    let samplePlayer = Player(
        playerId: "8478402", // Example: Connor McDavid
        name: "Connor McDavid",
        positionCode: "C",
        teamId: "22",
        teamAbbre: "EDM",
        lastTeamId: nil,
        lastTeamAbbre: nil,
        lastSeasonId: nil,
        sweaterNumber: 97,
        active: true,
        height: "6'1\"",
        heightInInches: 73,
        heightInCentimeters: 185,
        weightInPounds: 193,
        weightInKilograms: 88,
        birthCity: "Richmond Hill",
        birthStateProvince: "ON",
        birthCountry: "Canada"
    )

    return NavigationView {
        PlayerDetailView(player: samplePlayer)
    }
}
