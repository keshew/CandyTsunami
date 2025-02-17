import SwiftUI

struct CandyMenuView: View {
    @StateObject var candyMenuModel =  CandyMenuViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(.bgBlur)
                    .resizable()
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 60) {
                        Spacer()
                        VStack(spacing: 50) {
                            Image(.menuLabel)
                                .resizable()
                                .frame(width: geometry.size.width * 0.882,
                                       height: geometry.size.height * 0.227)
                            
                            HStack {
                                NumberOfLifes(geometry: geometry)
                                
                                Spacer()
                                
                                NumberOfStarts(geometry: geometry)
                            }
                            .padding(.horizontal, 35)
                        }
                        
                        VStack {
                            
                        }
                        
                        VStack(spacing: 50) {
                            NavigationLink(destination: CandyLevelView()) {
                                PlayButtonView()
                            }
                            
                            HStack(spacing: 20) {
                                NavigationLink(destination: CandyShopView()) {
                                    CircleButtonView(image: CandyImageName.shopImage.rawValue,
                                                     text: "SHOP",
                                                     sizeW: geometry.size.width * 0.173,
                                                     sizeH: geometry.size.height * 0.074,
                                                     geometry: geometry)
                                }
                                
                                NavigationLink(destination: CandyCollectionView()) {
                                    CircleButtonView(image: CandyImageName.collectionImage.rawValue,
                                                     text: "COLLECTION",
                                                     sizeW: geometry.size.width * 0.173,
                                                     sizeH: geometry.size.height * 0.068,
                                                     geometry: geometry)
                                }
                                
                                NavigationLink(destination: CandySettingsView()) {
                                    CircleButtonView(image: CandyImageName.settingsImage.rawValue,
                                                     text: "SETTINGS",
                                                     sizeW: geometry.size.width * 0.134,
                                                     sizeH: geometry.size.height * 0.068,
                                                     geometry: geometry)
                                }
                            }
                        }
                        .padding(.bottom)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CandyMenuView()
}

