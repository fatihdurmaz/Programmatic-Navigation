//
//  Programmatic_NavigationApp.swift
//  Programmatic Navigation
//
//  Created by Fatih Durmaz on 31.07.2024.
//

import SwiftUI

@main
struct Programmatic_NavigationApp: App {
    @State private var router = Router()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(router)
        }
    }
}
