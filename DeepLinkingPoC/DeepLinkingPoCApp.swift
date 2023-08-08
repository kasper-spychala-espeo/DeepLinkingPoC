//
//  DeepLinkingPoCApp.swift
//  DeepLinkingPoC
//
//  Created by Kasper Spychala on 08/08/2023.
//

import SwiftUI
import DeepLinkingApp

@main
struct DeepLinkingPoCApp: App {
    var deepLinkingManager = DeepLinkingManager()
    @State var deepLink: DeepLink?
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.deepLink, deepLink)
                .onOpenURL { url in
                    deepLink = deepLinkingManager.handleDeepLink(url: url)
                }
        }
    }
}
