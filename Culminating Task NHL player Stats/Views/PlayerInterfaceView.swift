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
    
    // MARK: Computed properties
    var body: some View {
        ScrollView {
                   VStack(spacing: 20) {
                       if let currentPlayer = viewModelInterface.currentPlayer {
                           
                           // Headshot
                           AsyncImage(url: URL(string: currentPlayer.headshot)) { image in
                               image.resizable()
                                   .scaledToFit()
                                   .frame(width: 150, height: 150)
                                   .clipShape(Circle())
                           } placeholder: {
                               ProgressView()
                           }
                           
                           // Hero Image
                           AsyncImage(url: URL(string: currentPlayer.heroImage)) { image in
                               image.resizable()
                                   .scaledToFit()
                                   .frame(height: 200)
                                   .cornerRadius(10)
                           } placeholder: {
                               ProgressView()
                           }
                           
                           // Height and Weight
                           ZStack {
                               Rectangle()
                                   .fill(Color(.systemGray6))
                                   .cornerRadius(10)
                                   .frame(width: 320, height: 80)
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
                                   .frame(width: 320, height: 100)
                               VStack {
                                   Text("Born: \(currentPlayer.birthDate)")
                                   Text("Birth City: \(currentPlayer.birthCity.default)")
                                   Text("Country: \(currentPlayer.birthCountry)")
                               }
                           }
                           
                           // Shoots / Catches
                           ZStack {
                               Rectangle()
                                   .fill(Color(.systemGray6))
                                   .cornerRadius(10)
                                   .frame(width: 320, height: 50)
                               Text("Shoots/Catches: \(currentPlayer.shootsCatches)")
                           }
                           
                           // Draft Info
                           ZStack {
                               Rectangle()
                                   .fill(Color(.systemGray6))
                                   .cornerRadius(10)
                                   .frame(width: 320, height: 150)
                               VStack(alignment: .leading, spacing: 5) {
                                   Text("Draft Year: \(currentPlayer.draftDetails.year)")
                                   Text("Draft Team: \(currentPlayer.draftDetails.teamAbbrev)")
                                   Text("Round: \(currentPlayer.draftDetails.round)")
                                   Text("Pick In Round: \(currentPlayer.draftDetails.pickInRound)")
                                   Text("Overall Pick: \(currentPlayer.draftDetails.overallPick)")
                               }
                               .padding()
                           }
                           
                           // Navigation to another view (Career Stats)
                           NavigationLink(destination: PlayerDetailView(player: player)) {
                               Rectangle()
                                   .fill(Color(.systemGray6))
                                   .frame(width: 320, height: 80)
                                   .cornerRadius(10)
                                   .overlay(
                                       Text("Career Stats")
                                           .foregroundColor(.black)
                                           .bold()
                                   )
                           }
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
                               AsyncImage(url: URL(string: currentPlayer.teamLogo)) { image in
                                   image.resizable()
                                       .scaledToFit()
                                       .frame(width: 30, height: 30)
                               } placeholder: {
                                   ProgressView()
                               }
                               HStack(spacing: 10) {
                                   Text(player.name)
                                       .font(.headline)
                                   Text("#\(currentPlayer.sweaterNumber) / \(currentPlayer.position)")
                                       .font(.caption)
                                       .foregroundColor(.secondary)
                               }
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

           return NavigationView {
               PlayerInterfaceView(player: samplePlayer)
           }
       }
