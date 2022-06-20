//
//  ContentView.swift
//  City Sights App
//
//  Created by мас on 26.02.2022.
//

import SwiftUI
import CoreLocation

struct LaunchView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
            // Detect the authorization status of geolocating the user
        
        if model.authorizationState == .notDetermined {
        
            // If undetermined, show onboarding
                OnboardingView()
        }
        
        else if model.authorizationState == .authorizedAlways || model.authorizationState == .authorizedWhenInUse {
            
            // If approved, show home view
            
            HomeView()
        
        }
        else {
            
            // If denied show denied screen
            LocationDeniedView()
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
