//
//  FirestoreManager.swift
//  HotTakes
//
//  Created by Noman Ahmad on 1/9/22.
//

import Foundation
import FirebaseFirestore

class FirestoreManager {
    let db = Firestore.firestore()
    static let shared = FirestoreManager()
    
    
    
    func addUserProfile(first_name: String, last_name: String, email: String, userID: String) {
        db.collection("UserProfiles").document(userID).setData([
            "first_name": first_name,
            "last_name": last_name,
            "email": email,
            "userID": userID
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
}
