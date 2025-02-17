import SwiftUI

struct CandyShopView: View {
    @StateObject var candyShopModel =  CandyShopViewModel()
    @Environment(\.presentationMode) var presentationMode
    @State var isRules = false
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(.bgBlur)
                    .resizable()
                    .ignoresSafeArea()
                
                ScrollView {
                    
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
                            
                            CircleButtonText(image: CandyImageName.rulesForegorund.rawValue,
                                             text: "RULES",
                                             sizeW: geometry.size.height * 0.04,
                                             sizeH: geometry.size.height * 0.06,
                                             geometry: geometry) {
                                isRules = true
                            }
                                             .padding(.trailing)
                        }
                        
                        VStack(spacing: 15) {
                            Image(.shopLabel)
                                .resizable()
                                .frame(width: geometry.size.width * 0.457,
                                       height: geometry.size.height * 0.115)
                            
                            HStack {
                                NumberOfLifes(geometry: geometry)
                                
                                Spacer()
                                
                                NumberOfStarts(geometry: geometry)
                            }
                            .padding(.horizontal, 35)
                            
                            Text("BONUSES")
                                .Demi(size: 50)
                        }
                        
                        Spacer(minLength: 15)
                        
                        VStack(spacing: geometry.size.height * 0.072) {
                            HStack(spacing: 20) {
                                BonusLabel(text: "BONUS TIME",
                                           image: CandyImageName.bonusTime.rawValue,
                                           sizeW: geometry.size.width * 0.148,
                                           sizeH: geometry.size.height * 0.087,
                                           geometry: geometry) {
                                    UserDefaultsManager().buyTime()
                                    candyShopModel.test = 1
                                }
                                
                                BonusLabel(text: "BONUS STEPS",
                                           image: CandyImageName.bonusStep.rawValue,
                                           sizeW: geometry.size.width * 0.165,
                                           sizeH: geometry.size.height * 0.087,
                                           geometry: geometry) {
                                    UserDefaultsManager().buyStep()
                                    candyShopModel.test = 1
                                }
                            }
                            
                            BonusLabel(text: "BONUS HEARTS",
                                       image: CandyImageName.heartImage.rawValue,
                                       sizeW: geometry.size.width * 0.183,
                                       sizeH: geometry.size.height * 0.083,
                                       geometry: geometry) {
                                UserDefaultsManager().buyLifes()
                                candyShopModel.test = 1
                            }
                        }
                    }
                }
                
                if isRules {
                    CandyRulesView(isRules: $isRules)
                        .ignoresSafeArea()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CandyShopView()
}

