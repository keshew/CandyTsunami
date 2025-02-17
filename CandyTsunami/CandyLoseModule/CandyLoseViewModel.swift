import SwiftUI

class CandyLoseViewModel: ObservableObject {
    let contact = CandyLoseModel()
    @Published var currentIndex = 0
}
