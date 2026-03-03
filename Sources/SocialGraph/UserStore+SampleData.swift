extension UserStore {
    public static func makeSampleStore() -> UserStore {
        let users = [
            User(
                username: "alice",
                isVisible: true,
                friends: ["bob", "charlie"]
            ),
            User(username: "bob", isVisible: true, friends: ["alice"]),
            User(
                username: "charlie",
                isVisible: true,
                friends: ["alice", "mario"]
            ),
            User(username: "mario", isVisible: true, friends: ["charlie"]),
        ]
        let userMap = Dictionary(
            uniqueKeysWithValues: users.map { ($0.username, $0) }
        )
        return UserStore(allUsers: userMap)
    }
}
