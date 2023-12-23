//
//  AuthService.swift
//  hoodoo-grimoire
//
//  Created by Fernando Marins on 23/12/23.
//

import Foundation
import Firebase

enum Errors: Error {
    case badConnection
}

struct AuthService {
    static let shared = AuthService()
    
    private init() {}
    
    func logUser(withEmail email: String, password: String, completion: ((AuthDataResult?, (any Error)?) -> Void)?) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    func registerUser(email: String, password: String, completion:  @escaping (Error?, DatabaseReference) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let uid = result?.user.uid else { return }
            
            let values = [
                "email": email
            ]
            
            Database.database().reference().child("users").child(uid).updateChildValues(values, withCompletionBlock: completion)
        }
    }
}
