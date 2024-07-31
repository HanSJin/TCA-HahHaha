//
//  MySampleApp.swift
//  MySample
//
//  Created by 한승진 on 7/31/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct MySampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                store: Store(initialState: ContentFeature.State(), reducer: {
                    ContentFeature()
                })
            )
        }
    }
}
