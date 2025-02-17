import SwiftUI

class CandyCollectionViewModel: ObservableObject {
    let contact = CandyCollectionModel()
    @Published var userDefaults = UserDefaultsManager()
    let grid = [GridItem(.flexible(), spacing: -20),
                GridItem(.flexible(), spacing: -20),
                GridItem(.flexible(), spacing: -20)]
    @Published var offset: CGSize = .zero
    @Published var currentIndex = 0
    
    init() {
           self.userDefaults = UserDefaultsManager()
           self.userDefaults.loadCollectionItems()
       }
}
