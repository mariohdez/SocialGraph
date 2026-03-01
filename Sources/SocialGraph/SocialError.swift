//
//  SocialError.swift
//  SocialGraph
//
//  Created by Mario Hernandez on 3/1/26.
//

/// An enumeration of errors that can be thrown by the social graph
/// operations.
enum SocialError: Error, Equatable {
    /// The friends list of a user cannot contain themselves.
    case befriendingSelf

    /// The friends list of a user cannnot contain the given
    /// username more than once.
    case alreadyFriend(username: String)

    /// The user is not found in the user store.
    case userNotFound
}
