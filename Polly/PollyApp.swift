//
//  PollyApp.swift
//  Polly
//
//  Created by Raj Raval on 8/1/25.
//

import SwiftUI

@main
struct PollyApp: App {

    private let persistenceController = PersistenceController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.viewContext)
        }
    }
}
