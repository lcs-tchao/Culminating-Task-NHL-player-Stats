//
//  Culminating_Task_NHL_player_StatsApp.swift
//  Culminating Task NHL player Stats
//
//  Created by Yuk Yeung Chao on 2025-04-20.
//

import SwiftUI

@main
struct CulminatingTaskNHLPlayerStatsApp: App {
    @State var playerViewModel = PlayerViewModel()
    
    var body: some Scene {
        WindowGroup {
            LandingView()
                .environment(playerViewModel)
        }
    }
}
