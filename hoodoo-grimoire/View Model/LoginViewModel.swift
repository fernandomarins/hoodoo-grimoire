//
//  LoginViewModel.swift
//  hoodoo-grimoire
//
//  Created by Fernando Marins on 23/12/23.
//

import Foundation

class LoginViewModel {
    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
        AuthService.shared.logUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error)
                return
            }
            
            completion(true)
        }
    }
}
