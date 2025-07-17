//
//  TotalActivityReport.swift
//  Report
//
//  Created by Aleksandr Chernyshev on 7/15/25.

import SwiftUI
import DeviceActivity
import ManagedSettings

struct TotalActivityReport: DeviceActivityReportScene {
    
    let context: DeviceActivityReport.Context = .totalActivity
    let content: ([AppData]) -> TotalActivityView
    
    func makeConfiguration(representing data: DeviceActivityResults<DeviceActivityData>) async -> [AppData] {
        var applicationsActivities = [ApplicationToken: TimeInterval]()
        
        for await activityData in data {
            for await segment in activityData.activitySegments {
                for await categoryResult in segment.categories {
                    for await applicationResult in categoryResult.applications {
                        guard let token = applicationResult.application.token else { continue }
                        applicationsActivities[token, default: 0] += applicationResult.totalActivityDuration
                    }
                }
            }
        }
        
        return applicationsActivities.map {
            AppData(application: $0.key, time: $0.value)
        }
    }
}
