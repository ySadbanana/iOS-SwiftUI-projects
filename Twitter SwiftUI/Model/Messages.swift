//
//  Messages.swift
//  Twitter SwiftUI
//
//  Created by Yerlan Nurumov on 27.01.2021.
//

import Firebase

struct Message: Identifiable {
    
    let text: String
    let user: User
    let toID: String
    let fromID: String
    let isFromCurrentUser: Bool
    let timestamp: Timestamp
    let id: String
    
    var chatPartnerId: String { return isFromCurrentUser ? toID : fromID }
    init(user: User, dictionary: [String: Any]) {
        self.user = user
        
        self.text = dictionary["text"] as? String ?? ""
        self.toID = dictionary["toID"] as? String ?? ""
        self.fromID = dictionary["fromID"] as? String ?? ""
        self.isFromCurrentUser = fromID == Auth.auth().currentUser?.uid
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        self.id = dictionary["id"] as? String ?? ""

    }
}

struct MockMessage: Identifiable {
    let id: Int
    let imageName: String
    let messageText: String
    let isCurrentUser: Bool
}

let MOCK_MESSAGES: [MockMessage] = [
    .init(id: 0, imageName: "spiderman", messageText: "Hey, what's up?", isCurrentUser: false),
    .init(id: 1, imageName: "batman", messageText: "Everything is OK, you?", isCurrentUser: true),
    .init(id: 2, imageName: "spiderman", messageText: "I am too!", isCurrentUser: false),
    .init(id: 3, imageName: "spiderman", messageText: "Do you have any good ideas to the weekend?", isCurrentUser: false),
    .init(id: 4, imageName: "batman", messageText: "I'll go to crash Jokers face", isCurrentUser: true),
    .init(id: 5, imageName: "spiderman", messageText: "Seems pretty good)", isCurrentUser: false),
]
