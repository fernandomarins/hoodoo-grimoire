//
//  ViewModel.swift
//  hoodoo-grimoire
//
//  Created by Fernando Marins on 22/12/23.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

class RootViewModel: ObservableObject {
    @Published var selectedItems = [Item]()
    
    var items = [Item]()
    var ref = Database.database().reference()
    
    func readValue() {
        ref.child("items").observeSingleEvent(of: .value) { [weak self] snapshot in
            guard let data = snapshot.value as? [[String: Any]] else { return }
            
            let itemsArray: [Item] = data.compactMap { object in
                guard let categoryString = object["category"] as? String,
                      let category = Category(rawValue: categoryString),
                      let name = object["name"] as? String,
                      let instructions = object["instructions"] as? String,
                      let items = object["items"] as? [String],
                      let description = object["description"] as? String,
                      let typeString = object["type"] as? String,
                let type = `Type`(rawValue: typeString) else {
                    return nil
                }
                
                return Item(
                    id: UUID(),
                    type: type,
                    category: category,
                    name: name,
                    instructions: instructions,
                    description: description,
                    items: items
                )
            }
            
            self?.items = itemsArray
            self?.update(category: .oils)
        }
    }
    
    func update(category: Category) {
        selectedItems = items.filter { $0.category == category }
    }
    
    func logout(completion: @escaping (Bool) -> Void) {
        AuthService.shared.logout(completion: completion)
    }
}

