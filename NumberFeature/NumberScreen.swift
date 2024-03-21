import Protocols
import SwiftUI

public struct NumberScreen: View {
    @Environment(\.dismiss) private var dismiss

    @StateObject private var viewModel: NumberScreenViewModel

    public init(numberClient: NumberClientProtocol) {
        self._viewModel = StateObject(
            wrappedValue: NumberScreenViewModel(numberClient: numberClient)
        )
    }

    public var body: some View {
        VStack {
            Group {
                switch viewModel.state {
                case .loading:
                    ProgressView()
                case .loaded(let number):
                    Text(number, format: .number)
                        .font(.largeTitle)
                case .failed(let error):
                    Text(error.localizedDescription)
                }
            }
            .frame(height: 100)

            Button("Dismiss") {
                dismiss()
            }
        }
        .task {
            await viewModel.onAppear()
        }
    }
}

#Preview {
    NumberScreen(
        numberClient: NumberClientMock(fetchHandler: { 99 })
    )
}
