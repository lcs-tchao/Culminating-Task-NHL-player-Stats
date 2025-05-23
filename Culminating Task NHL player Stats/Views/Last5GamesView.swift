//
//  24-25SeasonStatsView.swift
//  Culminating Task NHL player Stats
//
//  Created by Yuk Yeung Chao on 2025-05-20.
//

import SwiftUI

struct LastFiveGamesView: View {
    let games: [LastGame]

    var body: some View {
        ScrollView {
            VStack {
                ForEach(games) { game in
                    VStack {
                        TextRow(label: "Date", value: game.gameDate)
                        TextRow(label: "Opponent", value: game.opponentAbbrev)
                        TextRow(label: "Team", value: game.teamAbbrev)
                        TextRow(label: "Location", value: game.homeRoadFlag == "H" ? "Home" : "Road")
                        TextRow(label: "Goals", value: "\(game.goals)")
                        TextRow(label: "Assists", value: "\(game.assists)")
                        TextRow(label: "Points", value: "\(game.points)")
                        TextRow(label: "Shots", value: "\(game.shots)")
                        TextRow(label: "Plus/Minus", value: "\(game.plusMinus)")
                        TextRow(label: "Time on Ice", value: game.toi)
                        TextRow(label: "Shifts", value: "\(game.shifts)")
                        TextRow(label: "PIM", value: "\(game.pim)")

                        Divider()
                    }
                   
                }
            }
            .padding()
        }
        .navigationTitle("Last 5 Games")
    }
    private func TextRow(label: String, value: String) -> some View {
        HStack {
            Text(label + ":")
                .fontWeight(.semibold)
            Spacer()
            Text(value)
        }
    }
}

// MARK: - Preview
struct LastFiveGamesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LastFiveGamesView(games: sampleLastGames)
        }
    }

    // Sample data for preview
    static var sampleLastGames: [LastGame] = [
        LastGame(assists: 1, gameDate: "2025-05-14", gameId: 1, gameTypeId: 3, goals: 0, homeRoadFlag: "R", opponentAbbrev: "VGK", pim: 0, plusMinus: 0, points: 1, powerPlayGoals: 0, shifts: 25, shorthandedGoals: 0, shots: 3, teamAbbrev: "EDM", toi: "23:50"),
        LastGame(assists: 2, gameDate: "2025-05-12", gameId: 2, gameTypeId: 3, goals: 1, homeRoadFlag: "H", opponentAbbrev: "VGK", pim: 0, plusMinus: 1, points: 3, powerPlayGoals: 0, shifts: 23, shorthandedGoals: 0, shots: 5, teamAbbrev: "EDM", toi: "21:13")
    ]
}
