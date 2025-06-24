//
//  ChaisBiasApp.swift
//  ChaisBias
//
//  Created by Chaira Harder on 6/24/25.
//

import SwiftUI

@main
struct ChaisBiasApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
