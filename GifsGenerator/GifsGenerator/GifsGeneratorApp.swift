//
//  GifsGeneratorApp.swift
//  GifsGenerator
//
//  Created by Suttroogun Yogin on 22/02/2024.
//

import SwiftUI

@main
struct GifsGeneratorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
