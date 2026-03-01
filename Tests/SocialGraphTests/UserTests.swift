//
//  UserTests.swift
//  SocialGraph
//
//  Created by Mario Hernandez on 3/1/26.
//

import Testing

@testable import SocialGraph

struct Test {
    @Test("Initializing a User sets all properties correctly")
    func initialization() async throws {
        let mario = User(username: "mario", isVisible: true, friends: ["alice"])
        #expect(mario.username == "mario")
        #expect(mario.isVisible == true)
        #expect(mario.friends.count == 1)
        #expect(mario.friends == ["alice"])
    }

    @Test("Adding a valid friend updates the friends list")
    func addFriendSuccessfully() async throws {
        var mario = User(username: "mario", isVisible: true, friends: ["alice"])
        try mario.addFriend(username: "bob")
        #expect(mario.friends.count == 2)
        #expect(mario.friends == ["alice", "bob"])
    }

    @Test("Users cannot befriend themselves")
    func befriendingSelf() async throws {
        var mario = User(username: "mario", isVisible: true, friends: ["alice"])
        #expect(throws: SocialError.befriendingSelf) {
            try mario.addFriend(username: "mario")
        }
    }
   
    @Test("Users cannot add the same friend twice")
    func duplicateFriend() async throws {
        var mario = User(username: "mario", isVisible: true, friends: ["alice"])
        #expect(throws: SocialError.alreadyFriend(username: "alice")) {
            try mario.addFriend(username: "alice")
        }
    }
}
