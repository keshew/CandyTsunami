import SwiftUI
import SpriteKit

struct CandyGameRulesView: View {
    @StateObject var candyGameRulesModel =  CandyGameRulesViewModel()
    var game: CandyGameData
    var scene: SKScene
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(.black)
                    .ignoresSafeArea()
                    .opacity(0.5)
                
                ScrollView {
                    VStack {
                        Spacer(minLength: 70)
                        
                        Image(.rulesLabel)
                            .resizable()
                            .frame(width: geometry.size.width * 0.655,
                                   height: geometry.size.height * 0.13)
                        
                        Spacer(minLength: 50)
                        ZStack {
                            Image(.rulesLabelBackground)
                                .resizable()
                            
                            VStack {
                                Text("The goal of the game\nis to feel the entire\nfield with one color,\nmoving from the\nupper-left corner. To\ndo this, select the color adjacent to the\noccupied area by\nclicking on it. The\nnumber of moves is\nlimited.")
                                    .Demi(size: 30)
                                    .multilineTextAlignment(.center)
                                
                            }
                            .offset(y: -10)
                              
                            
                            Button(action: {
                                game.isRules = false
                                scene.isPaused = false
                            }) {
                                ZStack {
                                    Image(.backForPlayButton)
                                        .resizable()
                                        .frame(width: geometry.size.width * 0.403,
                                               height: geometry.size.height * 0.084)
                                    
                                    Text("BACK TO\nGAME")
                                        .Demi(size: 20, outlineWidth: 0.6)
                                }
                            }
                            .offset(y: geometry.size.height * 0.2861)
                        }
                        .frame(width: geometry.size.width * 0.803,
                               height: geometry.size.height * 0.585)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let gameData = CandyGameData()
    let scene = SKScene()
    return CandyGameRulesView(game: gameData, scene: scene)
}

