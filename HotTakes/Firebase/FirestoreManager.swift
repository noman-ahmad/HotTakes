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
    
    
    func userProfileExists(userID: String, completion: @escaping(Bool) -> Void) {
        let docRef = db.collection("UserProfiles").document(userID)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
                completion(true)
            } else {
                print("Document does not exist")
                completion(false)
            }
        }
    }
    
    
    
    func addUserProfile(first_name: String, last_name: String, email: String, userID: String, imageID: String) {
        db.collection("UserProfiles").document(userID).setData([
            "first_name": first_name,
            "last_name": last_name,
            "email": email,
            "userID": userID,
            "imageID": imageID
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
}
