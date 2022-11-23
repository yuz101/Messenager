//
//  DatabaseManager.swift
//  Messenger
//
//  Created by Yuru Zhou on 11/22/22.
//

import Foundation
import FirebaseDatabase

class DataBaseManager {
    static let database = Database.database().reference()
    
    static func insertUser(user: ChatUser) {
        database.child(user.id).setValue([
            "first_name": user.firstName,
            "last_name": user.lastName,
            "email_address": user.emailAddress
        ])
    }
    
//    static func checkUserExistence(id: String, completion: @escaping (Bool) -> Void){
//        database.child(id).observeSingleEvent(of: .value) { snapshot in
//            if (snapshot.value as? String) != nil {
//                completion(true)
//            }
//            completion(false)
//        }
//    }
}
