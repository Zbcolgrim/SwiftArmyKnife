//
//  Pokemon.swift
//  SwiftArmyKnife
//
//  Created by Zachary Buffington on 2/17/22.
//

import Foundation

struct Pokemon: Codable {
    let name: String
    let id: Int
    let sprites: SpriteSheet
    
}

struct  SpriteSheet: Codable {
    let frontDefault: URL
}
