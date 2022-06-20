//
//  HomeView.swift
//  City Sights App
//
//  Created by мас on 01.03.2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var isMapShowing = false
    @State var selectedBusiness: Business?
    
    var body: some View {
        
        if model.restaurants.count != 0 || model.sights.count != 0 {
            
            
            NavigationView {
            
            if !isMapShowing {
                
                // Show List
                VStack(alignment: .leading) {
                    
                    HStack {
                
                        Image(systemName: "location")
                        Text(model.placemark?.locality ?? "")
                        Spacer()
                        Button("Switch to map view") {
                            self.isMapShowing = true
}
                        .foregroundColor(.blue)
                    
                    }

                    Divider()
                    
                    ZStack (alignment: .top) {
                        BusinessList()
                        
                        HStack {
                            Spacer()
                            
                            YelpAttrubution(link: "https://yelp.ca")
                        }
                        .padding(.trailing, -20)
                    }
                }
                .padding([.top, .horizontal])
                .navigationBarHidden(true)
                
            } else {
                
            // Show Map
                ZStack(alignment: .top) {
                BusinessMap(selectedBusiness: $selectedBusiness)
                    .ignoresSafeArea()
                    .sheet(item: $selectedBusiness) { business in
                        // Create a business detail view instance
                        // Pass in the selected business
                        BusinessDetail(business: business)
                        }
                    ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                            .cornerRadius(5)
                            .frame(height: 48)
                            
                        HStack {
                    
                            Image(systemName: "location")
                            Text(model.placemark?.locality ?? "")
                            Spacer()
                            Button("Switch to list view") {
                                self.isMapShowing = false
                                }.foregroundColor(.blue)
                        
                            }
                            .padding()
                        }
                        .padding()
                    }
                .navigationBarHidden(true)
                
                }
            }
        } else {
            
            // Spinner
        
            ProgressView()
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
