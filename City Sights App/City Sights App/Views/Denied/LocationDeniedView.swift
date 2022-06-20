//
//  LocationDeniedView.swift
//  City Sights App
//
//  Created by мас on 25.03.2022.
//

import SwiftUI

struct LocationDeniedView: View {
    
    let backgroundColor = Color(red: 23/255, green: 141/255, blue: 138/255)
    
    var body: some View {

        VStack (spacing: 20) {
            
            Spacer()
            
            Text("Whoops!")
                .font(.title)
            
            Text("We need to access your location in order to provide you the best sights in the city! You can change your decision at any time in Settings.")
            
            Spacer()
            
            Button {
                
                // Open Settings by getting the swttings url
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    
                    if UIApplication.shared.canOpenURL(url) {
                     
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        
                    }
                }
                
            } label: {
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 48)
                        .cornerRadius(10)
                    
                    Text("Go to Settings")
                        .bold()
                        .foregroundColor(backgroundColor)
                        .padding()
                }
                .padding()
            
            }

            Spacer()
        }
        .padding()
        .foregroundColor(.white)
        .multilineTextAlignment(.center)
        .background(backgroundColor)
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct LocationDeniedView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDeniedView()
    }
}
