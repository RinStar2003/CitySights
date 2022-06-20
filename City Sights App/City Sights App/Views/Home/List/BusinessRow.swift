//
//  BusinessRow.swift
//  City Sights App
//
//  Created by мас on 05.03.2022.
//

import SwiftUI

struct BusinessRow: View {
    
    @ObservedObject var business: Business
    
    var body: some View {
        
        VStack (alignment: .leading) {
            
            HStack {
                
                // MARK: - Image
                let uiImage = UIImage(data: business.imageData ?? Data())
                Image(uiImage: uiImage ?? UIImage())
                    .resizable()
                    .frame(width: 58, height: 58)
                    .cornerRadius(5)
                    .scaledToFit()
                
                // MARK: - Name and distance
                VStack(alignment: .leading) {
                    
                    Text(business.name ?? "")
                        .bold()
                        .multilineTextAlignment(.leading)
                        
                    Text(String(format: "%.1f km away", (business.distance ?? 0) / 1000))
                        .font(.caption)
                }
                
                Spacer()
                
                // MARK: - Star rating and number of reviews
                
                VStack(alignment: .leading) {
                    
                    Image("regular_\(business.rating ?? 0)")
                    Text("\(business.reviewCount ?? 0) reviews")
                        .font(.caption)
                
                }
            }
            
            
            DashedDivider()
                .padding(.horizontal)
            
        }
        .foregroundColor(.black)
    }
}

