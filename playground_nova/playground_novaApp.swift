//
//  playground_novaApp.swift
//  playground_nova
//
//  Created by Richard Menning on 03.12.21.
//

import SwiftUI

@main
struct playground_novaApp: App {
    @StateObject var viewRouter: ViewRouter = ViewRouter()
    var body: some Scene {
        WindowGroup {
            ContentView(viewRouter: ViewRouter())
        }
    }
}
