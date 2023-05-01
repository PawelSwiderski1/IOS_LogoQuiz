//
//  MyQuizApp.swift
//  MyQuiz
//
//  Created by Pawel Swiderski on 03/08/2022.
//

import SwiftUI

@main
struct MyQuizApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
