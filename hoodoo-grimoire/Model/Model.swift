//
//  Model.swift
//  hoodoo-grimoire
//
//  Created by Fernando Marins on 22/12/23.
//

import Foundation

struct Item: Identifiable {
    let id: UUID
    let type: `Type`
    let category: Category
    let name, instructions, description: String
    let items: [String]
}
