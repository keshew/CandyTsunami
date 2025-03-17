import SwiftUI
import SpriteKit
import GameplayKit

struct CBitMask {
    static let ball: UInt32 = 7
    static let yellowBall: UInt32 = 3
    static let obstacle: UInt32 = 5
}

class CandyGameData: ObservableObject {
    @Published var isPause = false
    @Published var isMenu = false
    @Published var isWin = false
    @Published var isLose = false
    @Published var isRules = false
    @Published var isTimeTapped = false
    @Published var isStepTapped = false
    @Published var timeLeft = 120
    @Published var tapCount = 0
    @Published var totalTap = 27
    @Published var scene = SKScene()
}

class GridNode: SKSpriteNode {
    var row: Int
    var col: Int
    var itemName: String

    init(row: Int, col: Int, imageName: String) {
        self.row = row
        self.col = col
        self.itemName = imageName
        let texture = SKTexture(imageNamed: imageName)
        super.init(texture: texture, color: .clear, size: texture.size())
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CandyGameSpriteKit: SKScene, SKPhysicsContactDelegate {
    var game: CandyGameData?
    var gridNodes: [[GridNode]] = []
    var nodesToChange: [GridNode] = []
    var level = 1
    var timer: Timer!
    var currentTimeLabel: SKLabelNode!
    var stepLabel: SKLabelNode!
    
    func createMainObject() {
        let gameBackground = SKSpriteNode(imageNamed: CandyImageName.gameBg.rawValue)
        gameBackground.size = CGSize(width: size.width, height: size.height)
        gameBackground.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(gameBackground)
        
        let rulesLabel = SKLabelNode(fontNamed: "FranklinGothic-Demi")
        rulesLabel.attributedText = NSAttributedString(string: "RULES", attributes: [
            NSAttributedString.Key.font: UIFont(name: "FranklinGothic-Demi", size: 20)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor(red: 192/255, green: 24/255, blue: 176/255, alpha: 1),
            NSAttributedString.Key.strokeWidth: -6
        ])
        rulesLabel.position = CGPoint(x: size.width / 1.15, y: size.height / 1.25)
        addChild(rulesLabel)
        
        let menuLabel = SKLabelNode(fontNamed: "FranklinGothic-Demi")
        menuLabel.attributedText = NSAttributedString(string: "MENU", attributes: [
            NSAttributedString.Key.font: UIFont(name: "FranklinGothic-Demi", size: 20)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor(red: 192/255, green: 24/255, blue: 176/255, alpha: 1),
            NSAttributedString.Key.strokeWidth: -6
        ])
        menuLabel.position = CGPoint(x: size.width / 8, y: size.height / 1.25)
        addChild(menuLabel)
        
        let timeBack = SKSpriteNode(imageNamed: CandyImageName.backForBudget.rawValue)
        timeBack.size = CGSize(width: size.width * 0.391, height: size.height * 0.0916)
        timeBack.position = CGPoint(x: size.width / 4, y: size.height / 1.42)
        addChild(timeBack)
        
        let time = SKSpriteNode(imageNamed: CandyImageName.timeGame.rawValue)
        time.size = CGSize(width: size.width * 0.125, height: size.height * 0.116)
        time.position = CGPoint(x: size.width / 6.5, y: size.height / 1.42)
        addChild(time)
        
        let timeLabel = SKLabelNode(fontNamed: "FranklinGothic-Demi")
        timeLabel.attributedText = NSAttributedString(string: "TIME", attributes: [
            NSAttributedString.Key.font: UIFont(name: "FranklinGothic-Demi", size: 25)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor(red: 192/255, green: 24/255, blue: 176/255, alpha: 1),
            NSAttributedString.Key.strokeWidth: -5
        ])
        timeLabel.position = CGPoint(x: size.width / 3.4, y: size.height / 1.42)
        addChild(timeLabel)
        
        let stepBack = SKSpriteNode(imageNamed: CandyImageName.backForBudget.rawValue)
        stepBack.size = CGSize(width: size.width * 0.391, height: size.height * 0.0916)
        stepBack.position = CGPoint(x: size.width / 1.4, y: size.height / 1.42)
        addChild(stepBack)
        
        let step = SKSpriteNode(imageNamed: CandyImageName.stepGame.rawValue)
        step.size = CGSize(width: size.width * 0.185, height: size.height * 0.089)
        step.position = CGPoint(x: size.width / 1.25, y: size.height / 1.42)
        addChild(step)
    }
    
    func createMutatingObject() {
        let levelLabel = SKLabelNode(fontNamed: "FranklinGothic-Demi")
        levelLabel.attributedText = NSAttributedString(string: "LEVEL \(UserDefaultsManager.defaults.object(forKey: Keys.currentLevel.rawValue) as? Int ?? 1)", attributes: [
            NSAttributedString.Key.font: UIFont(name: "FranklinGothic-Demi", size: 36)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor(red: 192/255, green: 24/255, blue: 176/255, alpha: 1),
            NSAttributedString.Key.strokeWidth: -6
        ])
        levelLabel.position = CGPoint(x: size.width / 2, y: size.height / 1.3)
        addChild(levelLabel)
        
        currentTimeLabel = SKLabelNode(fontNamed: "FranklinGothic-Demi")
        currentTimeLabel.attributedText = NSAttributedString(string: "\(game!.timeLeft / 60):\(game!.timeLeft % 60)", attributes: [
            NSAttributedString.Key.font: UIFont(name: "FranklinGothic-Demi", size: 25)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor(red: 192/255, green: 24/255, blue: 176/255, alpha: 1),
            NSAttributedString.Key.strokeWidth: -5
        ])
        currentTimeLabel.position = CGPoint(x: size.width / 3.4, y: size.height / 1.48)
        addChild(currentTimeLabel)
        
        stepLabel = SKLabelNode(fontNamed: "FranklinGothic-Demi")
        stepLabel.attributedText = NSAttributedString(string: "\(game!.tapCount)/\(game!.totalTap)", attributes: [
            NSAttributedString.Key.font: UIFont(name: "FranklinGothic-Demi", size: 25)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor(red: 192/255, green: 24/255, blue: 176/255, alpha: 1),
            NSAttributedString.Key.strokeWidth: -4
        ])
        stepLabel.position = CGPoint(x: size.width / 1.58, y: size.height / 1.455)
        addChild(stepLabel)
    }
    
    func createTappedObjects() {
        let menuBack = SKSpriteNode(imageNamed: CandyImageName.backCircleImage.rawValue)
        menuBack.name = "menuBack"
        menuBack.size = CGSize(width: size.width * 0.199, height: size.height * 0.0915)
        menuBack.position = CGPoint(x: size.width / 8, y: size.height / 1.13)
        addChild(menuBack)
        
        let menu = SKSpriteNode(imageNamed: CandyImageName.homeImage.rawValue)
        menu.name = "menu"
        menu.size = CGSize(width: size.width * 0.167, height: size.height * 0.0767)
        menu.position = CGPoint(x: size.width / 8, y: size.height / 1.13)
        addChild(menu)
        
        let rulesBack = SKSpriteNode(imageNamed: CandyImageName.backCircleImage.rawValue)
        rulesBack.size = CGSize(width: size.width * 0.199, height: size.height * 0.0915)
        rulesBack.name = "rulesBack"
        rulesBack.position = CGPoint(x: size.width / 1.15, y: size.height / 1.13)
        addChild(rulesBack)
        
        let rules = SKSpriteNode(imageNamed: CandyImageName.rulesForegorund.rawValue)
        rules.name = "rules"
        rules.size = CGSize(width: size.width * 0.082, height: size.height * 0.0573)
        rules.position = CGPoint(x: size.width / 1.15, y: size.height / 1.13)
        addChild(rules)
        
        let bonusStepBack = SKSpriteNode(imageNamed: CandyImageName.backCircleImage.rawValue)
        bonusStepBack.name = "bonusStepBack"
        bonusStepBack.size = CGSize(width: size.width * 0.199, height: size.height * 0.0915)
        bonusStepBack.position = CGPoint(x: size.width / 8, y: size.height / 8)
        addChild(bonusStepBack)
        
        let bonusStep = SKSpriteNode(imageNamed: CandyImageName.bonusStep.rawValue)
        bonusStep.name = "bonusStep"
        bonusStep.size = CGSize(width: size.width * 0.087, height: size.height * 0.0413)
        bonusStep.position = CGPoint(x: size.width / 8, y: size.height / 8)
        addChild(bonusStep)
        
        let bonusLabel = SKLabelNode(fontNamed: "FranklinGothic-Demi")
        bonusLabel.attributedText = NSAttributedString(string: "BONUS", attributes: [
            NSAttributedString.Key.font: UIFont(name: "FranklinGothic-Demi", size: 20)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor(red: 192/255, green: 24/255, blue: 176/255, alpha: 1),
            NSAttributedString.Key.strokeWidth: -6
        ])
        bonusLabel.position = CGPoint(x: size.width / 8, y: size.height / 22)
        addChild(bonusLabel)
        
        let stepLabel = SKLabelNode(fontNamed: "FranklinGothic-Demi")
        stepLabel.attributedText = NSAttributedString(string: "STEP", attributes: [
            NSAttributedString.Key.font: UIFont(name: "FranklinGothic-Demi", size: 20)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor(red: 192/255, green: 24/255, blue: 176/255, alpha: 1),
            NSAttributedString.Key.strokeWidth: -6
        ])
        stepLabel.position = CGPoint(x: size.width / 8, y: size.height / 49)
        addChild(stepLabel)
        
        let bonusTimeBack = SKSpriteNode(imageNamed: CandyImageName.backCircleImage.rawValue)
        bonusTimeBack.size = CGSize(width: size.width * 0.199, height: size.height * 0.0915)
        bonusTimeBack.name = "bonusTimeBack"
        bonusTimeBack.position = CGPoint(x: size.width / 1.15, y: size.height / 8)
        addChild(bonusTimeBack)
        
        let bonusTime = SKSpriteNode(imageNamed: CandyImageName.bonusTime.rawValue)
        bonusTime.name = "bonusTime"
        bonusTime.size = CGSize(width: size.width * 0.087, height: size.height * 0.0413)
        bonusTime.position = CGPoint(x: size.width / 1.15, y: size.height / 8)
        addChild(bonusTime)
        
        let bonusTimeLabel = SKLabelNode(fontNamed: "FranklinGothic-Demi")
        bonusTimeLabel.attributedText = NSAttributedString(string: "BONUS", attributes: [
            NSAttributedString.Key.font: UIFont(name: "FranklinGothic-Demi", size: 20)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor(red: 192/255, green: 24/255, blue: 176/255, alpha: 1),
            NSAttributedString.Key.strokeWidth: -6
        ])
        bonusTimeLabel.position = CGPoint(x: size.width / 1.15, y: size.height / 22)
        addChild(bonusTimeLabel)
        
        let timeBonusLabel = SKLabelNode(fontNamed: "FranklinGothic-Demi")
        timeBonusLabel.attributedText = NSAttributedString(string: "TIME", attributes: [
            NSAttributedString.Key.font: UIFont(name: "FranklinGothic-Demi", size: 20)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor(red: 192/255, green: 24/255, blue: 176/255, alpha: 1),
            NSAttributedString.Key.strokeWidth: -6
        ])
        timeBonusLabel.position = CGPoint(x: size.width / 1.15, y: size.height / 49)
        addChild(timeBonusLabel)
        
        let pauseBack = SKSpriteNode(imageNamed: CandyImageName.backForPlayButton.rawValue)
        pauseBack.size = CGSize(width: size.width * 0.376, height: size.height * 0.0699)
        pauseBack.name = "pauseBack"
        pauseBack.position = CGPoint(x: size.width / 2, y: size.height / 8)
        addChild(pauseBack)
        
        let pauseLabel = SKLabelNode(fontNamed: "FranklinGothic-Demi")
        pauseLabel.attributedText = NSAttributedString(string: "PAUSE", attributes: [
            NSAttributedString.Key.font: UIFont(name: "FranklinGothic-Demi", size: 20)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor(red: 192/255, green: 24/255, blue: 176/255, alpha: 1),
            NSAttributedString.Key.strokeWidth: -6
        ])
        pauseLabel.position = CGPoint(x: size.width / 2, y: size.height / 9)
        addChild(pauseLabel)
    }
    
    func createGrid() {
            let itemCount = 7
        let itemSpacing: CGFloat = size.width * 0.132
        let itemHeight: CGFloat = size.height * 0.063

            let startX = (size.width - CGFloat(itemCount - 1) * itemSpacing) / 2
            let startY = size.height / 1.67

            for row in 0..<itemCount {
                var rowNodes: [GridNode] = []
                for col in 0..<itemCount {
                    let itemImage = returnAllItems().randomElement()!
                    let item = GridNode(row: row, col: col, imageName: itemImage)
                    item.size = CGSize(width: itemSpacing, height: itemHeight)
                    let x = startX + CGFloat(col) * itemSpacing
                    let y = startY - CGFloat(row) * itemHeight
                    item.position = CGPoint(x: x, y: y)
                    addChild(item)
                    rowNodes.append(item)
                }
                gridNodes.append(rowNodes)
            }
        }
    
    func returnAllItems() -> [String] {
        var array = [""]
        
        if level >= 0, level <= 3 {
            array = ["item1",
                     "item2",
                     "item3",
                     "item4"]
        } else if level > 3, level <= 7  {
            array = ["item1",
                     "item2",
                     "item3",
                     "item4",
                     "item5"]
        } else if level > 7 {
            array = ["item1",
                     "item2",
                     "item3",
                     "item4",
                     "item5",
                     "item6"]
        }
        return array
    }
    
    func setupView() {
           createMainObject()
           createMutatingObject()
           createTappedObjects()
           createGrid()
            startTimer()
           if let startNode = gridNodes.first?.first {
               nodesToChange.append(startNode)
           }
       }
    
    func checkIfGameIsWon() -> Bool {
           let firstImageName = gridNodes[0][0].itemName

           for row in gridNodes {
               for node in row {
                   if node.itemName != firstImageName {
                       return false
                   }
               }
           }
           return true
       }
    
    func changeColor(of node: GridNode) {
         let newImageName = node.itemName
         let targetImageName = gridNodes[0][0].itemName
         guard newImageName != targetImageName else { return }
         var visited = Set<GridNode>()
         func getNeighbors(of node: GridNode) -> [GridNode] {
             var neighbors: [GridNode] = []
             let row = node.row
             let col = node.col

             if row > 0 {
                 neighbors.append(gridNodes[row - 1][col])
             }
             if row < gridNodes.count - 1 {
                 neighbors.append(gridNodes[row + 1][col])
             }
             if col > 0 {
                 neighbors.append(gridNodes[row][col - 1])
             }
             if col < gridNodes[row].count - 1 {
                 neighbors.append(gridNodes[row][col + 1])
             }
             return neighbors
         }

         func findConnectedNodes(startNodes: [GridNode]) {
             var currentNodes = startNodes
             while !currentNodes.isEmpty {
                 var nextNodes: [GridNode] = []
                 for node in currentNodes {
                     if visited.contains(node) {
                         continue
                     }
                     visited.insert(node)
                     node.texture = SKTexture(imageNamed: newImageName)
                     node.itemName = newImageName

                     let neighbors = getNeighbors(of: node)
                     for neighbor in neighbors {
                         if !visited.contains(neighbor) && neighbor.itemName == targetImageName {
                             nextNodes.append(neighbor)
                         }
                     }
                 }
                 currentNodes = nextNodes
             }
         }

         if let startNode = gridNodes.first?.first {
             findConnectedNodes(startNodes: [startNode])
         }
     }
    
    func changeColor(touchLocation: CGPoint) {
        let touchedNode = nodes(at: touchLocation).first
        if let gridNode = touchedNode as? GridNode {
            game!.tapCount += 1
            stepLabel.attributedText = NSAttributedString(string: "\(game!.tapCount)/\(game!.totalTap)", attributes: [
                NSAttributedString.Key.font: UIFont(name: "FranklinGothic-Demi", size: 25)!,
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.strokeColor: UIColor(red: 192/255, green: 24/255, blue: 176/255, alpha: 1),
                NSAttributedString.Key.strokeWidth: -4
            ])

            changeColor(of: gridNode)
            
            if checkIfGameIsWon() {
                game!.isWin = true
                UserDefaultsManager().completeLevel()
            } else if game!.tapCount >= game!.totalTap {
                game!.isLose = true
                UserDefaultsManager().loseLevel()
            }
        }
    }
    
    func tapOnMenu(touchLocation: CGPoint) {
        if let tappedNode = self.atPoint(touchLocation) as? SKSpriteNode,
           tappedNode.name == "menu" || tappedNode.name == "menuBack"{
            game!.isMenu = true
            game!.scene = scene!
            scene?.isPaused = true
        }
    }
    
    func tapOnRules(touchLocation: CGPoint) {
        if let tappedNode = self.atPoint(touchLocation) as? SKSpriteNode,
           tappedNode.name == "rules" || tappedNode.name == "rulesBack"{
            game!.isRules = true
            game!.scene = scene!
            scene?.isPaused = true
        }
    }
    
    func tapOnBonusStep(touchLocation: CGPoint) {
        if let tappedNode = self.atPoint(touchLocation) as? SKSpriteNode,
           tappedNode.name == "bonusStep" || tappedNode.name == "bonusStepBack"{
            if game!.isStepTapped == false {
                if (UserDefaultsManager.defaults.object(forKey: Keys.stepCount.rawValue) as? Int ?? 1) != 0 {
                    game!.totalTap += 5
                    stepLabel.attributedText = NSAttributedString(string: "\(game!.tapCount)/\(game!.totalTap)", attributes: [
                        NSAttributedString.Key.font: UIFont(name: "FranklinGothic-Demi", size: 25)!,
                        NSAttributedString.Key.foregroundColor: UIColor.white,
                        NSAttributedString.Key.strokeColor: UIColor(red: 192/255, green: 24/255, blue: 176/255, alpha: 1),
                        NSAttributedString.Key.strokeWidth: -4
                    ])
                    let cuurentCount = UserDefaultsManager.defaults.object(forKey: Keys.stepCount.rawValue) as? Int ?? 1
                    UserDefaultsManager.defaults.set(cuurentCount - 1, forKey: Keys.stepCount.rawValue)
                    game!.isStepTapped = true
                }
            }
        }
    }
    
    func tapOnBonusTime(touchLocation: CGPoint) {
        if let tappedNode = self.atPoint(touchLocation) as? SKSpriteNode,
           tappedNode.name == "bonusTime" || tappedNode.name == "bonusTimeBack"{
            if game!.isTimeTapped == false {
                if (UserDefaultsManager.defaults.object(forKey: Keys.timeCount.rawValue) as? Int ?? 1) != 0 {
                    game!.timeLeft += 30
                    currentTimeLabel.attributedText = NSAttributedString(string: "\(game!.timeLeft/60):\(game!.timeLeft % 60)", attributes: [
                        NSAttributedString.Key.font: UIFont(name: "FranklinGothic-Demi", size: 25)!,
                        NSAttributedString.Key.foregroundColor: UIColor.white,
                        NSAttributedString.Key.strokeColor: UIColor(red: 192/255, green: 24/255, blue: 176/255, alpha: 1),
                        NSAttributedString.Key.strokeWidth: -5
                    ])
                    let cuurentCount = UserDefaultsManager.defaults.object(forKey: Keys.timeCount.rawValue) as? Int ?? 1
                    UserDefaultsManager.defaults.set(cuurentCount - 1, forKey: Keys.timeCount.rawValue)
                    game!.isTimeTapped = true
                }
            }
        }
    }
    
    func tapOnPause(touchLocation: CGPoint) {
        if let tappedNode = self.atPoint(touchLocation) as? SKSpriteNode,
           tappedNode.name == "pauseBack" {
            game!.isMenu = true
            game!.scene = scene!
            scene?.isPaused = true
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if self.game!.isRules == false, self.game!.isMenu == false {
                self.updateTimer()
            }
        }
    }
    
    func updateTimer() {
        if game?.timeLeft ?? 0 > 0{
                game?.timeLeft -= 1
                currentTimeLabel.attributedText = NSAttributedString(string: "\(game!.timeLeft/60):\(game!.timeLeft % 60)", attributes: [
                    NSAttributedString.Key.font: UIFont(name: "FranklinGothic-Demi", size: 25)!,
                    NSAttributedString.Key.foregroundColor: UIColor.white,
                    NSAttributedString.Key.strokeColor: UIColor(red: 192/255, green: 24/255, blue: 176/255, alpha: 1),
                    NSAttributedString.Key.strokeWidth: -5
                ])
            } else {
                if game!.isWin != true {
                    game?.isLose = true
                    scene?.isPaused = true
                    timer?.invalidate()
                }
            }
        }
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        size = UIScreen.main.bounds.size
        setupView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        changeColor(touchLocation: location)
        tapOnMenu(touchLocation: location)
        tapOnRules(touchLocation: location)
        tapOnBonusStep(touchLocation: location)
        tapOnBonusTime(touchLocation: location)
        tapOnPause(touchLocation: location)
    }
}

struct CandyGameView: View {
    @StateObject var candyGameModel =  CandyGameViewModel()
    @StateObject var gameModel =  CandyGameData()
    var body: some View {
        ZStack {
            SpriteView(scene: candyGameModel.createCandyGameScene(gameData: gameModel))
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
            
            if gameModel.isRules {
                CandyGameRulesView(game: gameModel, scene: gameModel.scene)
            }
            
            if gameModel.isMenu {
                CandyExitView(game: gameModel, scene: gameModel.scene)
            }
            
            if gameModel.isWin {
                CandyWinView()
            }
            
            if gameModel.isLose {
                CandyLoseView()
            }
        }
    }
}

#Preview {
    CandyGameView()
}

