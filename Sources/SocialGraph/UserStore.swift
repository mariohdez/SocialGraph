//
//  UserStore.swift
//  SocialGraph
//
//  Created by Mario Hernandez on 3/1/26.
//

/// An in-memory store for the users of the service.
public actor UserStore {
    var allUsers: [String: User]

    public init(allUsers: [String: User] = [:]) {
        self.allUsers = allUsers
    }
}

extension UserStore {
    /// If the username maps to a User and that user is visible,
    /// returns the User. Returns nil otherwise.
    public func lookUpUser(_ username: String) -> User? {
        guard let user = allUsers[username], user.isVisible else {
            return nil
        }
        return user
    }

    /// If the username maps to a User and that user is visible,
    /// returns the User. Otherwise, throws an error.
    public func user(for username: String) throws -> User {
        guard let user = lookUpUser(username) else {
            throw SocialError.userNotFound
        }
        return user
    }

    public func friendsOfFriends(_ username: String) throws -> [String] {
        let user = try user(for: username)
        let excluded = Set(user.friends + [username])

        return user.friends
            .compactMap { lookUpUser($0) }
            .flatMap { $0.friends }
            .filter { !excluded.contains($0) }
            .uniqued()
    }
}

extension Collection where Element: Hashable {
    func uniqued() -> [Element] {
        let unique = Set(self)
        return Array(unique)
    }
}
