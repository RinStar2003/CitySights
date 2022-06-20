//
//  OnboardingView.swift
//  City Sights App
//
//  Created by мас on 22.03.2022.
//

import SwiftUI

struct OnboardingView: View {
    
    @EnvironmentObject var model: ContentModel
    @State private var tabSelection = 0

    private let blue = Color(red: 0/225, green: 130/255, blue: 167/255)
    private let turquoise = Color(red: 55/255, green: 197/255, blue: 192/255)
    
    var body: some View {
        
        VStack {
            
            // TabView
            TabView(selection: $tabSelection, content: {
                
                // First tab
                VStack (spacing: 20) {
                    
                    Image("city1")
                        .resizable()
                        .scaledToFit()
                    Text("Welcome to the City Sights!")
                        .bold()
                        .font(.title)
                    Text("City Sights helps you find the best of the city!")
                        .multilineTextAlignment(.center)

                    
                }
                .foregroundColor(.white)
                .tag(0)
                
                // Second tab
                
                VStack (spacing: 20) {
                    
                    Image("city2")
                        .resizable()
                        .scaledToFit()
                    Text("Welcome to the City Sights!")
                        .bold()
                        .font(.title)
                    Text("We'll show you the best restaurants, venues and more, based on your location!")
                        .multilineTextAlignment(.center)
                    
                }
                .foregroundColor(.white)
                .tag(1)
                
            })
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            // Button
            Button {
                
                if tabSelection == 0 {
                    tabSelection = 1
                }
                else {
                    // TODO: - Request for geolocating permission
                    
                    model.requestGeoPermission()
                }
            } label: {
                
                ZStack {
                    
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 48)
                        .cornerRadius(10)
                    
                    Text( tabSelection == 0 ? "Next" : "Get my location!")
                        .bold()
                        .padding()
                    
                }
            }
            .padding([.leading, .bottom, .trailing])
            .accentColor(tabSelection == 0 ? blue : turquoise)
            
        }
        .background(tabSelection == 0 ? blue : turquoise)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
