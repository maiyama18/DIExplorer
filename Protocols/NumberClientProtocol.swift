public protocol NumberClientProtocol {
    func fetch() async throws -> Int
}

public struct NumberClientMock: NumberClientProtocol {
    private var fetchHandler: () async throws -> Int

    public init(fetchHandler: @escaping () async throws -> Int) {
        self.fetchHandler = fetchHandler
    }

    public func fetch() async throws -> Int {
        try await fetchHandler()
    }
}
