//
//  Report.swift
//  Report
//
//  Created by Aleksandr Chernyshev on 7/15/25.
//

import DeviceActivity
import SwiftUI

@main
struct Report: DeviceActivityReportExtension {
    var body: some DeviceActivityReportScene {
        TotalActivityReport { appData in
            TotalActivityView(appData: appData)
        }
    }
}
