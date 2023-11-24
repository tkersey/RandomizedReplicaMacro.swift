public extension String {
    static var replica: Self {
        .init(
            (0 ..< Int.random(in: 2 ..< 100)).map { _ in
                "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".randomElement()!
            }
        )
    }
}
