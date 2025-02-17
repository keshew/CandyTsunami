import SwiftUI

class CandyLoadingViewModel: ObservableObject {
    let contact = CandyLoadingModel()
    @Published var currentIndex = 0
    @Published var isMenu = false
}
