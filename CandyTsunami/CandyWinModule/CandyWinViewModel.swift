import SwiftUI

class CandyWinViewModel: ObservableObject {
    let contact = CandyWinModel()
    @Published var currentIndex = 0
}
