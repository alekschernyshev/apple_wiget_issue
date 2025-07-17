//
//  ContentView.swift
//  AppleTest
//
//  Created by Aleksandr Chernyshev on 7/15/25.
//

import SwiftUI
import DeviceActivity

struct ContentView: View {
    private let filter: DeviceActivityFilter
    @State private var updateTrigger = UUID()
    
    init() {
        self.filter = .init(segment: .hourly())
        self.updateReport()
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("Reload", action: updateReport)
                Spacer()
            }
            DeviceActivityReport(.totalActivity, filter: filter).id(updateTrigger)
        }.edgesIgnoringSafeArea(.bottom)
    }
    
    private func updateReport() {
        self.updateTrigger = UUID()
    }
}
