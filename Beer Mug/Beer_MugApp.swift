//
//  Beer_MugApp.swift
//  Beer Mug
//
//  Created by michael anthony on 2/25/24.
//

import SwiftUI
@main
struct Beer_MugApp: App {
    
    init() {
            UIDevice.current.isBatteryMonitoringEnabled = true
        }
    
    var body: some Scene {
        
        WindowGroup {
            ContentView()
        }

        WindowGroup(id: "Mug") {
            Mug()
        }
        
        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
        
    }
}
    
//struct WindowDestination {
//    static let Mug = "Mug"
//}
