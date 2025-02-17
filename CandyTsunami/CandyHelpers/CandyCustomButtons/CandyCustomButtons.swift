import SwiftUI

struct NumberOfLifes: View {
    var geometry: GeometryProxy
    var body: some View {
        ZStack {
            Image(.backForBudget)
                .resizable()
                .frame(width: geometry.size.width * 0.367,
                       height: geometry.size.height * 0.096)
            
            Image(.heart)
                .resizable()
                .frame(width: geometry.size.width * 0.225,
                       height: geometry.size.height * 0.1015)
                .offset(x: -geometry.size.height * 0.06)
            
            Text("\(UserDefaultsManager.defaults.object(forKey: Keys.lifes.rawValue) as? Int ?? 1)")
                .Demi(size: 30, outlineWidth: 0.6)
                .offset(x: 25)
        }
    }
}

struct NumberOfStarts: View {
    var geometry: GeometryProxy
    var body: some View {
        ZStack {
            Image(.backForBudget)
                .resizable()
                .frame(width: geometry.size.width * 0.367,
                       height: geometry.size.height * 0.096)
            
            Text("\(UserDefaultsManager.defaults.object(forKey: Keys.money.rawValue) as? Int ?? 1)")
                .Demi(size: 30, outlineWidth: 0.6)
                .offset(x: -25)
            
            Image(.stars)
                .resizable()
                .frame(width: 81, height: geometry.size.height * 0.101)
                .offset(x: 60)
        }
    }
}

struct PlayButton: View {
    var action: (() -> ())
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(.backForPlayButton)
                    .resizable()
                    .frame(width: 235, height: 95)
                
                ZStack {
                    Image(.backCircle)
                        .resizable()
                        .frame(width: 95, height: 93)
                    
                    Image(.play)
                        .resizable()
                        .frame(width: 55, height: 55)
                        .offset(x: 5)
                }
                .offset(x: -100)
                
                Text("Play")
                    .Demi(size: 50)
                    .offset(x: 20)
            }
        }
    }
}

struct PlayButtonView: View {
    var body: some View {
        ZStack {
            Image(.backForPlayButton)
                .resizable()
                .frame(width: 235, height: 95)
            
            ZStack {
                Image(.backCircle)
                    .resizable()
                    .frame(width: 95, height: 93)
                
                Image(.play)
                    .resizable()
                    .frame(width: 55, height: 55)
                    .offset(x: 5)
            }
            .offset(x: -100)
            
            Text("Play")
                .Demi(size: 50)
                .offset(x: 20)
        }
    }
}

struct CircleButtonText: View {
    var image: String
    var text: String
    var sizeW: CGFloat
    var sizeH: CGFloat
    var geometry: GeometryProxy
    var action: (() -> ())
    var body: some View {
        Button(action: {
            action()
        }) {
            VStack(spacing: 5) {
                ZStack {
                    Image(.backCircle)
                        .resizable()
                        .frame(width: geometry.size.width * 0.21,
                               height: geometry.size.height * 0.105)
                    
                    Image(image)
                        .resizable()
                        .frame(width: sizeW, height: sizeH)
                }
                
                Text(text)
                    .Demi(size: 20, outlineWidth: 0.6)
                    .minimumScaleFactor(0.7)
            }
        }
    }
}

struct CircleButtonView: View {
    var image: String
    var text: String
    var sizeW: CGFloat
    var sizeH: CGFloat
    var geometry: GeometryProxy
    var body: some View {
        VStack(spacing: 5) {
            ZStack {
                Image(.backCircle)
                    .resizable()
                    .frame(width: geometry.size.width * 0.21,
                           height: geometry.size.height * 0.105)
                
                Image(image)
                    .resizable()
                    .frame(width: sizeW, height: sizeH)
            }
            
            Text(text)
                .Demi(size: 20, outlineWidth: 0.6)
                .minimumScaleFactor(0.7)
        }
    }
}


struct DoneLevel: View {
    var text: String
    var geometry: GeometryProxy
    var body: some View {
        ZStack {
            Image(.doneLevel)
                .resizable()
                .frame(width: geometry.size.width * 0.1931, height: geometry.size.width * 0.1931)
            
            Text(text)
                .Demi(size: 34, colorOutline: Color(red: 7/255, green: 169/255, blue: 183/255))
        }
    }
}

struct CurrentLevel: View {
    var text: String
    var geometry: GeometryProxy
    var body: some View {
        ZStack {
            Image(.currentLevel)
                .resizable()
                .frame(width: geometry.size.width * 0.1931, height: geometry.size.width * 0.1931)
            
            Text(text)
                .Demi(size: 34, colorOutline: Color(red: 219/255, green: 46/255, blue: 83/255))
        }
    }
}


struct LockedLevel: View {
    var text: String
    var geometry: GeometryProxy
    var body: some View {
        ZStack {
            Image(.lockedLevel)
                .resizable()
                .frame(width: geometry.size.width * 0.1931, height: geometry.size.width * 0.1931)
            
            Text(text)
                .Demi(size: 34,
                      color: Color(red: 244/255, green: 244/255, blue: 244/255) ,
                      colorOutline: Color(red: 136/255, green: 136/255, blue: 136/255))
        }
    }
}

struct BonusLabel: View {
    var text: String
    var image: String
    var sizeW: CGFloat
    var sizeH: CGFloat
    var geometry: GeometryProxy
    var action: (() -> ())
    var body: some View {
        ZStack {
            Image(.bonusLabelBack)
                .resizable()
            
            VStack {
                Text(text)
                    .Demi(size: 20)
                
                HStack(spacing: 15) {
                    Image(image)
                        .resizable()
                        .frame(width: sizeW, height: sizeH)
                    
                    VStack(spacing: 0) {
                        Text("COST:")
                            .Demi(size: 20)
                        
                        HStack(spacing: 0) {
                            Text("30")
                                .Demi(size: 20)
                            
                            Image(.stars)
                                .resizable()
                                .frame(width: 17, height: 18)
                        }
                    }
                }
            }
            
            Button(action: {
                action()
            }) {
                ZStack {
                    Image(.backForPlayButton)
                        .resizable()
                        .frame(width: geometry.size.width * 0.255,
                               height: geometry.size.height * 0.0525)
                    
                    Text("BUY")
                        .Demi(size: 15, outlineWidth: 0.6)
                }
            }
            .offset(y: geometry.size.height * 0.102)
        }
        .frame(width: geometry.size.width * 0.465,
               height: geometry.size.height * 0.1635)
    }
}

struct ExitButton: View {
    var text: String
    var geometry: GeometryProxy
    var action: (() -> ())
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(.backForPlayButton)
                    .resizable()
                    .frame(width: geometry.size.width * 0.403,
                           height: geometry.size.height * 0.083)
                
                Text(text)
                    .Demi(size: 20, outlineWidth: 0.6)
            }
        }
    }
}

struct FirstWin: View {
    var geometry: GeometryProxy
    var text: String = "+1"
    var mainText: String = "CONGRATULATION\nYOU WON:"
    var textSize: CGFloat = 30
    var image: String = CandyImageName.heartImage.rawValue
    var sizeW: CGFloat = 0.264
    var sizeH: CGFloat = 0.119
    var action: (() -> ())
    var body: some View {
        ZStack {
            Image(.settingsLabelBack)
                .resizable()
            
            VStack(spacing: 20) {
                Text(mainText)
                    .Demi(size: textSize)
                    .multilineTextAlignment(.center)
                    .lineSpacing(15)
                
                HStack(spacing: 15) {
                    Text(text)
                        .Demi(size: 90)
                    
                    Image(image)
                        .resizable()
                        .frame(width: geometry.size.width * sizeW,
                               height: geometry.size.height * sizeH)
                }
            }
            
            Button(action: {
                action()
            }) {
                ZStack {
                    Image(.backForPlayButton)
                        .resizable()
                        .frame(width: geometry.size.width * 0.404,
                               height: geometry.size.height * 0.083)
                    
                    Text("NEXT")
                        .Demi(size: 20)
                }
            }
            .offset(y: geometry.size.height * 0.203)
        }
        .frame(width: geometry.size.width * 0.803,
               height: geometry.size.height * 0.354)
    }
}

struct SecondWin: View {
    var geometry: GeometryProxy
    var image: String
    var body: some View {
        ZStack {
            Image(.settingsLabelBack)
                .resizable()
                .frame(width: geometry.size.width * 0.803,
                       height: geometry.size.height * 0.354)
            
            VStack(spacing: 20) {
                Text("AND HERE YOUR\nNEW RECIPE FOR\nCOLLECTION:")
                    .Demi(size: 30)
                    .multilineTextAlignment(.center)
                
                Image(image)
                    .resizable()
                    .frame(width: geometry.size.width * 0.25,
                           height: geometry.size.height * 0.12)
            }
            
            HStack(spacing: 20) {
                NavigationLink(destination: CandyMenuView()) {
                    ZStack {
                        Image(.backForPlayButton)
                            .resizable()
                            .frame(width: geometry.size.width * 0.404,
                                   height: geometry.size.height * 0.083)
                        
                        Text("MENU")
                            .Demi(size: 20)
                    }
                }
                
                NavigationLink(destination: CandyGameView()) {
                    ZStack {
                        Image(.backForPlayButton)
                            .resizable()
                            .frame(width: geometry.size.width * 0.404,
                                   height: geometry.size.height * 0.083)
                        
                        Text("NEXT LEVEL")
                            .Demi(size: 20)
                    }
                }
            }
            .offset(y: geometry.size.height * 0.203)
        }
    }
}

struct SecondLose: View {
    var geometry: GeometryProxy
    var body: some View {
        ZStack {
            Image(.settingsLabelBack)
                .resizable()
                .frame(width: geometry.size.width * 0.803,
                       height: geometry.size.height * 0.354)
            
            VStack(spacing: 20) {
                Text("NICE TRY BUT YOU LOSE\nYOU LOSSES:")
                    .Demi(size: 25)
                    .multilineTextAlignment(.center)
                    .lineSpacing(15)
                
                HStack(spacing: 15) {
                    Text("+30")
                        .Demi(size: 90)
                    
                    Image(.stars)
                        .resizable()
                        .frame(width: geometry.size.width * 0.23,
                               height: geometry.size.height * 0.115)
                }
            }
            
            HStack(spacing: 20) {
                NavigationLink(destination: CandyMenuView()) {
                    ZStack {
                        Image(.backForPlayButton)
                            .resizable()
                            .frame(width: geometry.size.width * 0.404,
                                   height: geometry.size.height * 0.083)
                        
                        Text("MENU")
                            .Demi(size: 20)
                    }
                }
                .offset(y: geometry.size.height * 0.203)
          
                NavigationLink(destination: CandyGameView()) {
                    ZStack {
                        Image(.backForPlayButton)
                            .resizable()
                            .frame(width: geometry.size.width * 0.404,
                                   height: geometry.size.height * 0.083)
                        
                        Text("RETY!")
                            .Demi(size: 20)
                    }
                }
                .offset(y: geometry.size.height * 0.203)
            }
        }
    }
}
