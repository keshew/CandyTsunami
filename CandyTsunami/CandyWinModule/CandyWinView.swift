import SwiftUI

struct CandyWinView: View {
    @StateObject var candyWinModel =  CandyWinViewModel()
    @ObservedObject var audioManager = AudioManager.shared
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(.black)
                    .ignoresSafeArea()
                    .opacity(0.5)
                
                ScrollView {
                    VStack {
                        Spacer(minLength: 70)
                        
                        Image(.winLabel)
                            .resizable()
                            .frame(width: geometry.size.width * 0.8,
                                   height: geometry.size.height * 0.13)
                        
                        Spacer(minLength: 20)
                        
                        HStack {
                            NumberOfLifes(geometry: geometry)
                            
                            Spacer()
                            
                            NumberOfStarts(geometry: geometry)
                        }
                        .padding(.horizontal, 35)
                        
                        Spacer(minLength: 40)
                        
                        VStack {
                            if candyWinModel.currentIndex == 0 {
                                FirstWin(geometry: geometry) {
                                    candyWinModel.currentIndex += 1
                                }
                            } else if candyWinModel.currentIndex == 1 {
                                FirstWin(geometry: geometry,
                                         text: "+30",
                                         image: CandyImageName.starsImage.rawValue,
                                         sizeW: 0.23,
                                         sizeH: 0.115) {
                                    candyWinModel.currentIndex += 1
                                }
                            } else {
                                SecondWin(geometry: geometry, image: UserDefaultsManager().getRandomAndOpenItem()!.image)
                            }
                        }
                    }
                }
            }
            
            .onAppear {
                audioManager.stopMenuMusic()
                audioManager.playWinMusic()
            }
            
            .onDisappear {
                audioManager.stopWinMusic()
                audioManager.playMenuMusic()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CandyWinView()
}

