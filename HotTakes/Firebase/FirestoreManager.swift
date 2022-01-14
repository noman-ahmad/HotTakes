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
    
    func addTake(userID: String, prompt: String, q1: String, q2: String, q3: String, q4: String) {
        let customID = UUID().uuidString
        db.collection("HotTakes").document(customID).setData([
            "takeID": customID,
            "userID": userID,
            "prompt": prompt,
            "q1": q1,
            "q2": q2,
            "q3": q3,
            "q4": q4,
            "numAnswers": 0,
            "numQ1": 0,
            "numQ2": 0,
            "numQ3": 0,
            "numQ4": 0
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    
    func getAllUserTakes(userID: String, completed: @escaping ([TakeModel]) -> ()){
        
        var allTakes : [TakeModel] = []
        
        db.collection("HotTakes").whereField("userID", isEqualTo: userID)
            .getDocuments { (snapshot, error) in
                if let snapshot = snapshot {
                    for document in snapshot.documents {
                        let data = document.data()
                        let userID = data["userID"] as? String
                        let takeID = data["takeID"] as? String
                        let prompt = data["prompt"] as? String
                        let q1 = data["q1"] as? String
                        let q2 = data["q2"] as? String
                        let q3 = data["q3"] as? String
                        let q4 = data["q4"] as? String
                        let numAnswers = data["numAnswers"] as? Int
                        let numQ1 = data["numQ1"] as? Int
                        let numQ2 = data["numQ2"] as? Int
                        let numQ3 = data["numQ3"] as? Int
                        let numQ4 = data["numQ4"] as? Int
                        
                        print(userID)
                        print(takeID)
                        
                        let take = TakeModel(userID: userID!, takeID: takeID!, q1: q1!, q2: q2!, q3: q3!, q4: q4!, numAnswers: numAnswers!, numQ1: numQ1!, numQ2: numQ2!, numQ3: numQ3!, numQ4: numQ4!, prompt: prompt!)
                        print(take)
                        allTakes.append(take)
                    }
                    completed(allTakes)
                }
            }

    }

}
