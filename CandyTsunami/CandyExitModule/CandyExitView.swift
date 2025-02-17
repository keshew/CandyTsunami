import SwiftUI
import SpriteKit

struct CandyExitView: View {
    @StateObject var candyExitModel =  CandyExitViewModel()
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
                        
                        Image(.exitLabel)
                            .resizable()
                            .frame(width: geometry.size.width * 0.642,
                                   height: geometry.size.height * 0.152)
                        
                        HStack {
                            NumberOfLifes(geometry: geometry)
                            
                            Spacer()
                            
                            NumberOfStarts(geometry: geometry)
                        }
                        .padding(.horizontal, 35)
                        
                        Spacer(minLength: 50)
                        
                        ZStack {
                            Image(.settingsLabelBack)
                                .resizable()
                                .frame(width: geometry.size.width * 0.803,
                                       height: geometry.size.height * 0.354)
                            
                            Text("Do you seriously\nwant to exit this\nreset all\nprogress?")
                                .Demi(size: 40)
                                .multilineTextAlignment(.center)
                            
                            HStack(spacing: 30) {
                                
                                NavigationLink(destination: CandyMenuView()) {
                                    ZStack {
                                        Image(.backForPlayButton)
                                            .resizable()
                                            .frame(width: geometry.size.width * 0.403,
                                                   height: geometry.size.height * 0.083)
                                        
                                        Text("MENU")
                                            .Demi(size: 20, outlineWidth: 0.6)
                                    }
                                }
                                
                                ExitButton(text: "CONTINUE", geometry: geometry) {
                                    game.isMenu = false
                                    scene.isPaused = false
                                }
                            }
                            .offset(y: geometry.size.height * 0.203)
                        }
                      
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
    return CandyExitView(game: gameData, scene: scene)
}

