//
//  Model.swift
//  hoodoo-grimoire
//
//  Created by Fernando Marins on 22/12/23.
//

import Foundation

struct Items: Codable {
    let items: [Item]
}

struct Item: Codable {
    let name: String
    let items: [String]
    let instructions: String
}
