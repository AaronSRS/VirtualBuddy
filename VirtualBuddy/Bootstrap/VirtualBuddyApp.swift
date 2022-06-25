//
//  VirtualBuddyApp.swift
//  VirtualBuddy
//
//  Created by Guilherme Rambo on 07/04/22.
//

import SwiftUI
import VirtualCore

@main
struct VirtualBuddyApp: App {
    @NSApplicationDelegateAdaptor
    var appDelegate: VirtualBuddyAppDelegate

    @StateObject var settingsContainer = VBSettingsContainer.current
    @StateObject var updateController = SoftwareUpdateController.shared
    
    var body: some Scene {
        WindowGroup {
            LibraryView()
                .onAppearOnce(perform: updateController.activate)
        }
        .windowToolbarStyle(.unified)
        
        Settings {
            PreferencesView()
                .environmentObject(settingsContainer)
        }
    }
}
