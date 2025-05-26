//
//  PlayerCareerStatsView.swift
//  Culminating Task NHL player Stats
//
//  Created by Yuk Yeung Chao on 2025-04-20.
//

import SwiftUI

struct PlayerStatsView: View {
    // MARK: Stored properties
    let viewModelDetail: PlayerStatsViewModel

    // MARK: Computed properties
    var body: some View {
        ZStack {
            
            LinearGradient(
                colors: [Color.blue, Color.orange, Color.white],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    if let currentPlayer = viewModelDetail.currentPlayer {
                        Text(currentPlayer.fullTeamName.english)
                            .font(.title)
                            .bold()

                        Text(currentPlayer.fullTeamName.french)
                            .font(.title3)
                            .foregroundColor(.secondary)

                        Divider()

                        Text("Player Stats")
                            .font(.title2)
                            .bold()
                            .padding(.bottom, 5)

                        Group {
                            Text("24-25 SeasonStats")
                                .font(.title3)
                                .bold()
                                .padding(.bottom, 5)
                            statRow(label: "Assists", value: "\(currentPlayer.featuredStats.regularSeason.subSeason.assists)")
                            statRow(label: "Game Winning Goals", value: "\(currentPlayer.featuredStats.regularSeason.subSeason.gameWinningGoals)")
                            statRow(label: "Games Played", value: "\(currentPlayer.featuredStats.regularSeason.subSeason.gamesPlayed)")
                            statRow(label: "Goals", value: "\(currentPlayer.featuredStats.regularSeason.subSeason.goals)")
                            statRow(label: "OT Goals", value: "\(currentPlayer.featuredStats.regularSeason.subSeason.otGoals)")
                            statRow(label: "PIM", value: "\(currentPlayer.featuredStats.regularSeason.subSeason.pim)")
                            statRow(label: "Plus/Minus", value: "\(currentPlayer.featuredStats.regularSeason.subSeason.plusMinus)")
                            statRow(label: "Points", value: "\(currentPlayer.featuredStats.regularSeason.subSeason.points)")
                            statRow(label: "Power Play Goals", value: "\(currentPlayer.featuredStats.regularSeason.subSeason.powerPlayGoals)")
                            statRow(label: "Power Play Points", value: "\(currentPlayer.featuredStats.regularSeason.subSeason.powerPlayPoints)")
                            statRow(label: "Shooting %", value: String(format: "%.2f%%", currentPlayer.featuredStats.regularSeason.subSeason.shootingPctg * 100))
                            statRow(label: "Shorthanded Goals", value: "\(currentPlayer.featuredStats.regularSeason.subSeason.shorthandedGoals)")
                            statRow(label: "Shorthanded Points", value: "\(currentPlayer.featuredStats.regularSeason.subSeason.shorthandedPoints)")
                            statRow(label: "Shots", value: "\(currentPlayer.featuredStats.regularSeason.subSeason.shots)")

                            Divider()
                            Text("Career Stats")
                                .font(.title3)
                                .bold()
                                .padding(.bottom, 5)
                            statRow(label: "Assists", value: "\(currentPlayer.featuredStats.regularSeason.career.assists)")
                            statRow(label: "Game Winning Goals", value: "\(currentPlayer.featuredStats.regularSeason.career.gameWinningGoals)")
                            statRow(label: "Games Played", value: "\(currentPlayer.featuredStats.regularSeason.career.gamesPlayed)")
                            statRow(label: "Goals", value: "\(currentPlayer.featuredStats.regularSeason.career.goals)")
                            statRow(label: "OT Goals", value: "\(currentPlayer.featuredStats.regularSeason.career.otGoals)")
                            statRow(label: "PIM", value: "\(currentPlayer.featuredStats.regularSeason.career.pim)")
                            statRow(label: "Plus/Minus", value: "\(currentPlayer.featuredStats.regularSeason.career.plusMinus)")
                            statRow(label: "Points", value: "\(currentPlayer.featuredStats.regularSeason.career.points)")
                            statRow(label: "Power Play Goals", value: "\(currentPlayer.featuredStats.regularSeason.career.powerPlayGoals)")
                            statRow(label: "Power Play Points", value: "\(currentPlayer.featuredStats.regularSeason.career.powerPlayPoints)")
                            statRow(label: "Shooting %", value: String(format: "%.2f%%", currentPlayer.featuredStats.regularSeason.career.shootingPctg * 100))
                            statRow(label: "Shorthanded Goals", value: "\(currentPlayer.featuredStats.regularSeason.career.shorthandedGoals)")
                            statRow(label: "Shorthanded Points", value: "\(currentPlayer.featuredStats.regularSeason.career.shorthandedPoints)")
                            statRow(label: "Shots", value: "\(currentPlayer.featuredStats.regularSeason.career.shots)")
                        }

                        // *** New Last 5 Games Section ***
                        Divider()

                        Text("Last 5 Games")
                            .font(.title3)
                            .bold()
                            .padding(.bottom, 5)

                        LastFiveGamesView(games: viewModelDetail.lastGameStats?.last5Games ?? [])
                    }
                }
            }
            .padding()
        }
    }

    private func statRow(label: String, value: String) -> some View {
        HStack {
            Text(label + ":")
                .fontWeight(.semibold)
            Spacer()
            Text(value)
        }
    }
}


#Preview {
    @Previewable @State var samplePlayer = Player(
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
    
    PlayerStatsView(viewModelDetail: PlayerStatsViewModel(currentPlayerId: Int(samplePlayer.playerId) ?? 0))
}
