import Protocols

public struct NumberClientA: NumberClientProtocol {
    public init() {}
    
    public func fetch() async throws -> Int {
        try await Task.sleep(for: .seconds(1))
        return 42
    }
}

public struct NumberClientB: NumberClientProtocol {
    public init() {}
    
    public func fetch() async throws -> Int {
        try await Task.sleep(for: .seconds(1))
        return 7
    }
}
