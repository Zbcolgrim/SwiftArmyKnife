//
//  SunsetModel.swift
//  SwiftArmyKnife
//
//  Created by Zachary Buffington on 3/14/22.
//

import Foundation
struct Sun: Codable {
    let results: SunInfo
}
struct SunInfo: Codable {
    
    let sunrise: String
    let sunset: String
    let solarNoon: String
    let dayLength: String
    
}
