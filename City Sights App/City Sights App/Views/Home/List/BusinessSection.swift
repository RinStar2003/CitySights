//
//  BusinessSection.swift
//  City Sights App
//
//  Created by мас on 05.03.2022.
//

import SwiftUI

struct BusinessSection: View {
   
    var title: String
    var businesses: [Business]
    
    var body: some View {
        
        Section (header: BusinessSectionHeader(title: title)) {
        
        ForEach(businesses) { business in
            
            NavigationLink(destination: BusinessDetail(business: business)) {
            
                    BusinessRow(business: business)
                
                }
            }
        }
    }
}

