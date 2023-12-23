//
//  ViewModel.swift
//  hoodoo-grimoire
//
//  Created by Fernando Marins on 22/12/23.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

class ViewModel: ObservableObject {
    var ref = Database.database().reference()
    
    @Published var items = [Item]()
    
    func readValue() {
        
        ref.child("items").observeSingleEvent(of: .value) { [weak self] snapshot in
            guard let itemsDictionary = snapshot.value as? [String: Any] else { return }
            
            var itemsArray: [Item] = []
            
            for (_, itemValue) in itemsDictionary {
                if let itemData = itemValue as? [String: Any],
                   let name = itemData["name"] as? String,
                   let items = itemData["items"] as? [String],
                   let instructions = itemData["instructions"] as? String {
                    
                    let item = Item(name: name, items: items, instructions: instructions)
                    itemsArray.append(item)
                }
            }
            
            self?.items = itemsArray
            
        }
    }
}

