import Combine
import Protocols

@MainActor
final class NumberScreenViewModel: ObservableObject {
    enum State {
        case loading
        case loaded(number: Int)
        case failed(error: Error)
    }

    @Published private(set) var state: State = .loading

    private let numberClient: NumberClientProtocol

    init(numberClient: NumberClientProtocol) {
        self.numberClient = numberClient
    }

    func onAppear() async {
        do {
            let number = try await numberClient.fetch()
            state = .loaded(number: number)
        } catch {
            state = .failed(error: error)
        }
    }
}
