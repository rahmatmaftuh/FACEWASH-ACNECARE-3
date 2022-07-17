//
//  FACEWASH_ACNECAREApp.swift
//  FACEWASH-ACNECARE WatchKit Extension
//
//  Created by Local Administrator on 15/07/22.
//

import SwiftUI

@main
struct FACEWASH_ACNECAREApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                StartCountdownView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
