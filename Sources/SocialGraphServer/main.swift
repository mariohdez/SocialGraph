//
//  main.swift
//  SocialGraph
//
//  Created by Mario Hernandez on 3/1/26.
//

import Hummingbird
import SocialGraph

let router = Router()

router.get("/health") { _, _ in
    return "running..."
}

let app = Application(
    router: router,
    configuration: .init(address: .hostname("127.0.0.1", port: 8080))
)

try await app.runService()
