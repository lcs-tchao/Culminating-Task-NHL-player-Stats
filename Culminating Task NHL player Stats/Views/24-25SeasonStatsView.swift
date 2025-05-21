//
//  24-25SeasonStatsView.swift
//  Culminating Task NHL player Stats
//
//  Created by Yuk Yeung Chao on 2025-05-20.
//

import SwiftUI

struct FeaturedStatsView: View {

    @State var stats: FeaturedStatsCurrentSeason

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                Text("24-25 Season Stats")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 8)

                Group {
                    TextRow(label: "Assists", value: "\(stats.regularSeason.subSeason.assists)")
                    TextRow(label: "Game Winning Goals", value: "\(stats.regularSeason.subSeason.gameWinningGoals)")
                    TextRow(label: "Games Played", value: "\(stats.regularSeason.subSeason.gamesPlayed)")
                    TextRow(label: "Goals", value: "\(stats.regularSeason.subSeason.goals)")
                    TextRow(label: "OT Goals", value: "\(stats.regularSeason.subSeason.otGoals)")
                    TextRow(label: "PIM", value: "\(stats.regularSeason.subSeason.pim)")
                    TextRow(label: "Plus/Minus", value: "\(stats.regularSeason.subSeason.plusMinus)")
                    TextRow(label: "Points", value: "\(stats.regularSeason.subSeason.points)")
                    TextRow(label: "Power Play Goals", value: "\(stats.regularSeason.subSeason.powerPlayGoals)")
                    TextRow(label: "Power Play Points", value: "\(stats.regularSeason.subSeason.powerPlayPoints)")
                    TextRow(label: "Shooting %", value: String(format: "%.2f", stats.regularSeason.subSeason.shootingPctg * 100) + "%")
                    TextRow(label: "Shorthanded Goals", value: "\(stats.regularSeason.subSeason.shorthandedGoals)")
                    TextRow(label: "Shorthanded Points", value: "\(stats.regularSeason.subSeason.shorthandedPoints)")
                    TextRow(label: "Shots", value: "\(stats.regularSeason.subSeason.shots)")
                }
                .padding(.horizontal)
            }
            .padding()
        }
    }
}

struct TextRow: View {
    let label: String
    let value: String

    var body: some View {
        HStack {
            Text(label + ":")
                .fontWeight(.semibold)
            Spacer()
            Text(value)
        }
    }
}

// MARK: Preview
struct FeaturedStatsView_Previews: PreviewProvider {
    static let sampleStats = FeaturedStatsCurrentSeason(
        season: 20242025,
        regularSeason: RegularSeasonStats(
            subSeason: CurrentSeasonStats(
                assists: 74,
                gameWinningGoals: 3,
                gamesPlayed: 67,
                goals: 26,
                otGoals: 0,
                pim: 37,
                plusMinus: 20,
                points: 100,
                powerPlayGoals: 9,
                powerPlayPoints: 31,
                shootingPctg: 0.132653,
                shorthandedGoals: 0,
                shorthandedPoints: 0,
                shots: 196
            )
        )
    )

    static var previews: some View {
        FeaturedStatsView(stats: sampleStats)
    }
}
