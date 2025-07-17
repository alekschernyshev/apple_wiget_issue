//
//  AppleTestApp.swift
//  AppleTest
//
//  Created by Aleksandr Chernyshev on 7/15/25.
//

import SwiftUI
import FamilyControls

@main
struct AppleTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    try? await AuthorizationCenter.shared.requestAuthorization(for: .individual)
                    
                }
        }
    }
}
