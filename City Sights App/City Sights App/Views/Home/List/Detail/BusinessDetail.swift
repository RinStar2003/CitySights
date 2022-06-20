//
//  BusinessDetail.swift
//  City Sights App
//
//  Created by мас on 07.03.2022.
//

import SwiftUI

struct BusinessDetail: View {
    
    @State private var showDirections = false
    var business: Business
    
    var body: some View {

        VStack(alignment: .leading) {
            
            VStack(alignment: .leading, spacing: 0) {
            
            GeometryReader() { geometry in
                
            let uiImage = UIImage(data: business.imageData ?? Data())
            Image(uiImage: uiImage ?? UIImage())
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
            }
            .ignoresSafeArea(.all, edges: .top)
            
            ZStack(alignment: .leading) {
             
                Rectangle()
                    .frame(height: 36)
                    .foregroundColor(business.isClosed! ? .gray : .blue)
                
                Text(business.isClosed! ? "closed" : "Open")
                    .bold()
                    .foregroundColor(.white)
                    .padding(.leading)
            }
        }
            Group {
                
                HStack {
                    BusinessTitle(business: business)
                    .padding()
                    YelpAttrubution(link: business.url!).padding(.leading, 95)
                        
                }
                
                DashedDivider()
                    .padding(.horizontal)
                
                
                // Phone
                
                HStack {
                    
                    Text("Phone: ")
                        .bold()
                    Text(business.displayPhone ?? "")
                    Spacer()
                    Link("Call", destination: URL(string: "tel:\(business.phone ?? "")")!)
                }
                .padding()
                DashedDivider()
                    .padding(.horizontal)

                
                
                // Reviews
                HStack {
                    
                    Text("Reviews: ")
                        .bold()
                    Text("\(business.reviewCount ?? 0)")
                    Spacer()
                    Link("Read", destination: URL(string: "\(business.url ?? "")")!)
                }
                .padding()

                
                
                DashedDivider()
                    .padding(.horizontal)

                
                
                // Website
                
                HStack {
                    
                    Text("Website: ")
                        .bold()
                    Text(business.url ?? "")
                        .lineLimit(1)
                    Spacer()
                    Link("Visit", destination: URL(string: "\(business.url ?? "")")!)
                }
                .padding()

                
                DashedDivider()
                    .padding(.horizontal)

                
            
            }
            
            // Get Directions button
            
            Button {
                // TODO: Show directions
                showDirections = true
            } label: {
                ZStack {
                    
                    Rectangle()
                        .frame(height: 48)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                    
                    Text("Get Directions")
                        .bold()
                        .foregroundColor(.white)
                    
                }
            }
            .padding()
            .sheet(isPresented: $showDirections) {
                DirectionsView(business: business)
            }
            
        }
    }
}
