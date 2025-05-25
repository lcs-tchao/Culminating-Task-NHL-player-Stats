//
//  Career Stats.swift
//  Culminating Task NHL player Stats
//
//  Created by Yuk Yeung Chao on 2025-05-16.
//

import SwiftUI

struct PlayerInterfaceView: View {
    
    // MARK: Stored properties
    let player: Player
    @State var viewModelInterface = PlayerInterfaceViewModel()
    
    @Environment(PlayerViewModel.self) var viewModel
   
    @State var playerHasBeenSaved = false
    @State var buttonOpacity = 1.0  // FIXED: Set to 1.0 so the button is visible
    
    
    // MARK: Computed properties
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                if let currentPlayer = viewModelInterface.currentPlayer {
                    // Image
                    AsyncImage(url: URL(string: currentPlayer.heroImage)) { image in
                        image.resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .cornerRadius(10)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    // Headshot
                    HStack {
                        AsyncImage(url: URL(string: currentPlayer.headshot)) { image in
                            image.resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                                .clipShape(Circle())
                        } placeholder: {
                            ProgressView()
                        }
                        
                        VStack {
                            // Shoots / Catches
                            ZStack {
                                Rectangle()
                                    .fill(Color(.systemGray6))
                                    .cornerRadius(10)
                                    .frame(width: 200, height: 50)
                                Text("Shoots/Catches: \(currentPlayer.shootsCatches)")
                            }
                            
                            // Draft Info
                            ZStack {
                                Rectangle()
                                    .fill(Color(.systemGray6))
                                    .cornerRadius(10)
                                    .frame(width: 200, height: 150)
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("Draft Year: \(currentPlayer.draftDetails.year)")
                                    Text("Draft Team: \(currentPlayer.draftDetails.teamAbbrev)")
                                    Text("Round: \(currentPlayer.draftDetails.round)")
                                    Text("Pick In Round: \(currentPlayer.draftDetails.pickInRound)")
                                    Text("Overall Pick: \(currentPlayer.draftDetails.overallPick)")
                                }
                                .padding()
                            }
                        }
                    }
                    
                    // Height and Weight
                    ZStack {
                        Rectangle()
                            .fill(Color(.systemGray6))
                            .cornerRadius(10)
                            .frame(width: 360, height: 80)
                        HStack {
                            VStack {
                                Text("Height")
                                    .font(.caption)
                                Text("\(currentPlayer.heightInInches) in / \(currentPlayer.heightInCentimeters) cm")
                            }
                            Spacer()
                                .frame(width: 40)
                            VStack {
                                Text("Weight")
                                    .font(.caption)
                                Text("\(currentPlayer.weightInPounds) lbs / \(currentPlayer.weightInKilograms) kg")
                            }
                        }
                    }
                    
                    // Birth Info
                    ZStack {
                        Rectangle()
                            .fill(Color(.systemGray6))
                            .cornerRadius(10)
                            .frame(width: 360, height: 100)
                        VStack {
                            Text("Born: \(currentPlayer.birthDate)")
                            Text("Birth City: \(currentPlayer.birthCity.default)")
                            Text("Country: \(currentPlayer.birthCountry)")
                        }
                    }
                    
                    Divider()
                    
                    // Navigation to another view (Career Stats)
                    NavigationLink(
                        destination: PlayerStatsView(viewModelDetail: PlayerStatsViewModel(
                            currentPlayerId: Int(currentPlayer.playerId) ?? 0
                            )
                        )
                    ) {
                        Rectangle()
                            .fill(Color(.systemGray6))
                            .frame(width: 360, height: 80)
                            .cornerRadius(10)
                            .overlay(
                                Text("Career Stats")
                                    .foregroundColor(.black)
                                    .bold()
                            )
                    }
                    
                    // Save Button
                    Button {
                        viewModel.saveFavoritePlayer()
                        playerHasBeenSaved = true
                    } label: {
                        Text("Save for later")
                    }
                    .tint(.green)
                    .buttonStyle(.borderedProminent)
                    .opacity(buttonOpacity)
                    .padding(.bottom, 20)
                    .disabled(playerHasBeenSaved)
                }
            }
            .padding()
            .task {
                await viewModelInterface.fetchPlayer(for: player.playerId)
            }
        }
        // customize the navigation bar or toolbars in the view
        .toolbar {
            if let currentPlayer = viewModelInterface.currentPlayer {
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 10) {
                        Text(player.name)
                            .font(.headline)
                        AsyncImage(url: URL(string: currentPlayer.teamLogo)) { image in
                            image.resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        } placeholder: {
                            ProgressView()
                        }
                        Text("#\(currentPlayer.sweaterNumber) / \(currentPlayer.position)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
    }
}

#Preview {
    let samplePlayer = Player(
        playerId: "8478402",
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
    
    NavigationView {
        PlayerInterfaceView(player: samplePlayer)
            .environment(PlayerViewModel())
    }
}
