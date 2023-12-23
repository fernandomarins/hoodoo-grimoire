//
//  RegisterViewModel.swift
//  hoodoo-grimoire
//
//  Created by Fernando Marins on 23/12/23.
//

import Foundation
import Firebase

class RegisterViewModel: ObservableObject {
    func registerUser(email: String, password: String, completion: @escaping (Bool) -> Void) {
        AuthService.shared.registerUser(email: email, password: password) { error, ref in
            if let error = error {
                print("deu ruim")
                return
            }
            completion(true)
        }
    }
}
