import SwiftUI

@main
struct CandyTsunamiApp: App {
    var body: some Scene {
        WindowGroup {
            CandyLoadingView()
                .onAppear {
                    UserDefaultsManager().firstLaunch()
                }
        }
    }
}
