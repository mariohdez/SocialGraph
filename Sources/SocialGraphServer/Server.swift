//
//  main.swift
//  SocialGraph
//
//  Created by Mario Hernandez on 3/1/26.
//

import Hummingbird
import SocialGraph

struct FriendsResponse: Codable, ResponseEncodable {
    let friends: [String]
}

@main
struct SocialServer {
    static func main() async throws {
        let userStore = UserStore.makeSampleStore()

        let router = Router()
        router.group("friendsOfFriends").get("{username}") {
            request,
            context -> FriendsResponse in
            guard let username = context.parameters.get("username") else {
                throw HTTPError(
                    .badRequest,
                    message: "Missing username in path"
                )
            }

            do {
                let friends = try await userStore.friendsOfFriends(username)
                return FriendsResponse(friends: friends)
            } catch SocialError.userNotFound {
                throw HTTPError(
                    .notFound,
                    message: "User '\(username)' not found"
                )
            } catch {
                throw HTTPError(.internalServerError)
            }
        }

        let app = Application(router: router)
        try await app.runService()
    }
}
