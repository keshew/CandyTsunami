import SwiftUI

struct CandyLevelView: View {
    @StateObject var candyLevelModel =  CandyLevelViewModel()
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(.bgBlur)
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        CircleButtonText(image: CandyImageName.homeImage.rawValue,
                                         text: "MENU",
                                         sizeW: geometry.size.height * 0.08,
                                         sizeH: geometry.size.height * 0.08,
                                         geometry: geometry) {
                            presentationMode.wrappedValue.dismiss()
                        }
                                         .padding(.leading)
                        
                        Spacer()
                    }
                    
                    VStack(spacing: -10) {
                        Image(.menuLabel)
                            .resizable()
                            .frame(width: geometry.size.width * 0.8,
                                   height: geometry.size.height * 0.2)
                        
                        Text(candyLevelModel.returnText())
                            .Demi(size: 35, colorOutline: Color(red: 192/255, green: 24/255, blue: 176/255))
                    }
                    
                        Image(candyLevelModel.returnImage())
                            .resizable()
                            .frame(width: geometry.size.width * 0.461,
                                   height: geometry.size.height * 0.261)
                    
                    Spacer()
                    
                }
                
                ZStack {
                    Image(.backForLevel)
                        .resizable()
                        .frame(width: geometry.size.width + 50, height: geometry.size.height * 0.4)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 1.05)
                    
                  
                        NavigationLink(destination: CandyGameView()) {
                            if (UserDefaultsManager.defaults.object(forKey: Keys.currentLevel.rawValue) as? Int ?? 1) != 12 {
                            ZStack {
                                Image(.backCircle)
                                    .resizable()
                                    .frame(width: geometry.size.width * 0.263,
                                           height: geometry.size.height * 0.133)
                                
                                Image(.play)
                                    .resizable()
                                    .frame(width: geometry.size.width * 0.154,
                                           height: geometry.size.width * 0.154)
                                    .offset(x: 5)
                            }
                        }
                        }
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 1.1)
                      
                    
                    if candyLevelModel.level == 1 {
                        CurrentLevel(text: "\(candyLevelModel.level)", geometry: geometry)
                            .position(x: geometry.size.width / 2, y: geometry.size.height / 1.33)
                        
                        LockedLevel(text: "\(candyLevelModel.level + 1)", geometry: geometry)
                            .rotationEffect(Angle(degrees: 30))
                            .position(x: geometry.size.width / 1.27, y: geometry.size.height / 1.25)
                        
                        LockedLevel(text: "\(candyLevelModel.level + 2)", geometry: geometry)
                            .rotationEffect(Angle(degrees: 60))
                            .position(x: geometry.size.width / 1.01, y: geometry.size.height / 1.12)
                    } else if candyLevelModel.level == 2 {
                        DoneLevel(text: "\(candyLevelModel.level - 1)", geometry: geometry)
                            .rotationEffect(Angle(degrees: -30))
                            .position(x: geometry.size.width / 4.4, y: geometry.size.height / 1.25)
                        
                        CurrentLevel(text: "\(candyLevelModel.level)", geometry: geometry)
                            .position(x: geometry.size.width / 2, y: geometry.size.height / 1.33)
                        
                        LockedLevel(text: "\(candyLevelModel.level + 1)", geometry: geometry)
                            .rotationEffect(Angle(degrees: 30))
                            .position(x: geometry.size.width / 1.27, y: geometry.size.height / 1.25)
                        
                        LockedLevel(text: "\(candyLevelModel.level + 2)", geometry: geometry)
                            .rotationEffect(Angle(degrees: 60))
                            .position(x: geometry.size.width / 1.01, y: geometry.size.height / 1.12)
                    } else if candyLevelModel.level == 11 {
                        DoneLevel(text: "\(candyLevelModel.level - 2)", geometry: geometry)
                            .rotationEffect(Angle(degrees: -60))
                            .position(x: geometry.size.width / 73, y: geometry.size.height / 1.12)
                            
                        DoneLevel(text: "\(candyLevelModel.level - 1)", geometry: geometry)
                            .rotationEffect(Angle(degrees: -30))
                            .position(x: geometry.size.width / 4.4, y: geometry.size.height / 1.25)
                        
                        CurrentLevel(text: "\(candyLevelModel.level)", geometry: geometry)
                            .position(x: geometry.size.width / 2, y: geometry.size.height / 1.33)
                        
                        LockedLevel(text: "\(candyLevelModel.level + 1)", geometry: geometry)
                            .rotationEffect(Angle(degrees: 30))
                            .position(x: geometry.size.width / 1.27, y: geometry.size.height / 1.25)
                    } else if candyLevelModel.level == 12 {
                        DoneLevel(text: "\(candyLevelModel.level - 2)", geometry: geometry)
                            .rotationEffect(Angle(degrees: -60))
                            .position(x: geometry.size.width / 73, y: geometry.size.height / 1.12)
                            
                        DoneLevel(text: "\(candyLevelModel.level - 1)", geometry: geometry)
                            .rotationEffect(Angle(degrees: -30))
                            .position(x: geometry.size.width / 4.4, y: geometry.size.height / 1.25)
                        
                        CurrentLevel(text: "\(candyLevelModel.level)", geometry: geometry)
                            .position(x: geometry.size.width / 2, y: geometry.size.height / 1.33)
                    } else {
                        DoneLevel(text: "\(candyLevelModel.level - 2)", geometry: geometry)
                            .rotationEffect(Angle(degrees: -60))
                            .position(x: geometry.size.width / 73, y: geometry.size.height / 1.12)
                            
                        DoneLevel(text: "\(candyLevelModel.level - 1)", geometry: geometry)
                            .rotationEffect(Angle(degrees: -30))
                            .position(x: geometry.size.width / 4.4, y: geometry.size.height / 1.25)
                        
                        CurrentLevel(text: "\(candyLevelModel.level)", geometry: geometry)
                            .position(x: geometry.size.width / 2, y: geometry.size.height / 1.33)
                        
                        LockedLevel(text: "\(candyLevelModel.level + 1)", geometry: geometry)
                            .rotationEffect(Angle(degrees: 30))
                            .position(x: geometry.size.width / 1.27, y: geometry.size.height / 1.25)
                        
                        LockedLevel(text: "\(candyLevelModel.level + 2)", geometry: geometry)
                            .rotationEffect(Angle(degrees: 60))
                            .position(x: geometry.size.width / 1.01, y: geometry.size.height / 1.12)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CandyLevelView()
}

