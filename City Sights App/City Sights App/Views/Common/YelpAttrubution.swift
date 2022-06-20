//
//  YelpAttrubution.swift
//  City Sights App
//
//  Created by мас on 25.03.2022.
//

import SwiftUI

struct YelpAttrubution: View {
    
    var link: String
    
    var body: some View {
        
        Link(destination: URL(string: link)!) {
            Image("yelp")
                .resizable()
                .scaledToFit()
                .frame(height: 36)
        }
        
    }
}

struct YelpAttrubution_Previews: PreviewProvider {
    static var previews: some View {
        YelpAttrubution(link: "https://yelp.ca")
    }
}
