//
//  City_Sights_App.swift
//  City Sights App
//
//  Created by мас on 26.02.2022.
//

import SwiftUI

@main
struct City_Sights_App: App {
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(ContentModel())
            
        }
    }
}
