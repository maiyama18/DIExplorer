import NumberClient
import NumberFeature
import SwiftUI

struct ContentView: View {
    @State private var presented: Bool = false

    var body: some View {
        Button("Number") {
            presented = true
        }
        .sheet(isPresented: $presented) {
            NumberScreen(numberClient: NumberClientB())
        }
    }
}
