import SwiftUI

class CandyGameViewModel: ObservableObject {
    let contact = CandyGameModel()

    func createCandyGameScene(gameData: CandyGameData) -> CandyGameSpriteKit {
        let scene = CandyGameSpriteKit()
        scene.game  = gameData
        return scene
    }
}
