//
//  FirebaseAuthManager.swift
//  HotTakes
//
//  Created by Noman Ahmad on 1/9/22.
//

import FirebaseAuth
import UIKit

class FirebaseAuthManager {
    
    // allow shared member
    static let shared = FirebaseAuthManager()
    
    
    
    // function to sign up user
    func createUser(email: String, password: String, completion: @escaping (_ success: Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) {
            (authResult, error) in
            if let user = authResult?.user {
                print(user)
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    func loginUser(email: String, password: String, completion: @escaping (_ success: Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) {
            (result, error) in
            if let error = error, let _ = AuthErrorCode(rawValue: error._code) {
                completion(false)
            } else {
                completion(true)
            }
        }
    }
    
    
    func signoutUser() {
        do {
            try Auth.auth().signOut()
        }
        catch {
            print("Can't Sign Out")
        }
    }
    
    func getUserEmail() -> String {
        if let user = Auth.auth().currentUser {
            return user.email!
        } else {
            return ""
        }
    }
    
    func getUserID() -> String {
        if let user = Auth.auth().currentUser {
            return user.uid
        } else {
            return "" 
        }
    }
}
