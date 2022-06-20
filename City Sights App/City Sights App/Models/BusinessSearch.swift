//
//  BusinessSearch.swift
//  City Sights App
//
//  Created by мас on 28.02.2022.
//

import Foundation

struct BusinessSearch: Decodable {
    
    var businesses = [Business]()
    var total = 0
    var region = Region()   
    
}

struct Region: Decodable {
    
    var center = Coordinate()
    
}
