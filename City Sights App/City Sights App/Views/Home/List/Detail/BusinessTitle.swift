//
//  BusinessTitle.swift
//  City Sights App
//
//  Created by мас on 11.03.2022.
//

import SwiftUI

struct BusinessTitle: View {
    
    var business: Business
    
    var body: some View {
        
        // Business name
        VStack(alignment: .leading) {
        Text(business.name!)
                .bold()
                .font(.title2)
        
        // Address
        if business.location?.displayAddress != nil {
            ForEach(business.location!.displayAddress!, id: \.self) { displayLine in
                Text(displayLine)

            }
        }
        
        // Rating
        Image("regular_\(business.rating ?? 0)")        
        }
    }
}


