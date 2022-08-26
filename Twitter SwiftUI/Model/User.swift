//
//  User.swift
//  Twitter SwiftUI
//
//  Created by Yerlan Nurumov on 17.02.2021.
//

import Firebase

struct User: Identifiable {
    let id: String
    let username: String
    let profileImageUrl: String
    let fullname: String
    let email: String
    let isCurrentUser: Bool
    var stats: UserStats
    
    var isFollowed = false
    
//    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == self.id }
//    another way to know current user
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.isCurrentUser = Auth.auth().currentUser?.uid == self.id
        self.stats = UserStats(followers: 0, following: 0)
    }
}

struct UserStats {
    let followers: Int
    let following: Int
}
