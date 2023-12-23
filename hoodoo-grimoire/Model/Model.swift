//
//  Model.swift
//  hoodoo-grimoire
//
//  Created by Fernando Marins on 22/12/23.
//

import Foundation

struct Item: Codable, Identifiable {
    let id: UUID
    let category: Category
    let name, instructions, description: String
    let items: [String]
}
