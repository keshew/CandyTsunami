import SwiftUI

class CandySettingsViewModel: ObservableObject {
    let contact = CandySettingsModel()
    @Published var isSoundOff = false
    @Published var isMusicOff = false 
}
