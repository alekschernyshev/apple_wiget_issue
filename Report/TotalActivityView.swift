//
//  TotalActivityView.swift
//  Report
//
//  Created by Aleksandr Chernyshev on 7/15/25.
//

import SwiftUI
import FamilyControls
import DeviceActivity
import ManagedSettings

struct AppData {
    let uuid: String
    let time: TimeInterval
    let application: ApplicationToken
    
    init(application: ApplicationToken, time: TimeInterval) {
        self.uuid = UUID().uuidString
        self.application = application
        self.time = time
    }
}

struct TotalActivityView: View {
    let appData: [AppData]
    
    var body: some View {
        Text("Report")
        
        if appData.isEmpty {
            Text("No activities")
        } else {
            List {
                Section(content: {
                    ForEach(appData, id: \.uuid) { data in
                        VStack(alignment: .leading) {
                            Label(data.application)
                            HStack {
                                Spacer()
                                Text("Total activity: \(data.time)")
                            }
                        }
                    }
                }, header: {
                    Text("Application activities")
                })
            }
        }
    }
}
