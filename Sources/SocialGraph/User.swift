//
//  User.swift
//  SocialGraph
//
//  Created by Mario Hernandez on 3/1/26.
//

/// Represents a user in the social graph.
public struct User: Equatable, Hashable {
    /// The user's username, which must be unique in the service.
    public let username: String
    
    /// Wheather or not the user should be considered visible
    /// when performing queries.
    public var isVisible: Bool
    
    /// The usernames of the user's friends.
    public private(set) var friends: [String]
    
    public init(username: String, isVisible: Bool, friends: [String]) {
        self.username = username
        self.isVisible = isVisible
        self.friends = friends
    }
    
    public mutating func addFriend(username: String) throws {
        guard username != self.username else {
            throw SocialError.befriendingSelf
        }
        guard !friends.contains(username) else {
            throw SocialError.alreadyFriend(username: username)
        }
        friends.append(username)
    }
}
