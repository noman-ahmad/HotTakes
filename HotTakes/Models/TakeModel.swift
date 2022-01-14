//
//  TakeModel.swift
//  HotTakes
//
//  Created by Noman Ahmad on 1/13/22.
//

import Foundation

struct TakeModel : Decodable {
    let userID     : String
    let takeID     : String
    let q1         : String
    let q2         : String
    let q3         : String
    let q4         : String
    let numAnswers : Int
    let numQ1      : Int
    let numQ2      : Int
    let numQ3      : Int
    let numQ4      : Int
    let prompt     : String
    
    init(userID: String, takeID: String, q1: String, q2: String, q3: String, q4: String, numAnswers: Int, numQ1: Int, numQ2: Int, numQ3: Int, numQ4: Int, prompt: String) {
        self.userID = userID
        self.takeID = takeID
        self.q1 = q1
        self.q2 = q2
        self.q3 = q3
        self.q4 = q4
        self.numAnswers = numAnswers
        self.numQ1 = numQ1
        self.numQ2 = numQ2
        self.numQ3 = numQ3
        self.numQ4 = numQ4
        self.prompt = prompt
    }
}
