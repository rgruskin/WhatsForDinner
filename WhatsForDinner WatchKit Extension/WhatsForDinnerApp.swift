//
//  WhatsForDinnerApp.swift
//  WhatsForDinner WatchKit Extension
//
//  Created by Rich Gruskin on 4/20/21.
//

import SwiftUI

@main
struct WhatsForDinnerApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
