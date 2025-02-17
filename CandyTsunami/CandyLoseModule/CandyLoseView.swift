import SwiftUI

struct CandyLoseView: View {
    @StateObject var candyLoseModel =  CandyLoseViewModel()
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
                        
                        Image(.loseLabel)
                            .resizable()
                            .frame(width: geometry.size.width * 0.7,
                                   height: geometry.size.height * 0.1)
                        
                        Spacer(minLength: 20)
                        
                        HStack {
                            NumberOfLifes(geometry: geometry)
                            
                            Spacer()
                            
                            NumberOfStarts(geometry: geometry)
                        }
                        .padding(.horizontal, 35)
                        
                        Spacer(minLength: 40)
                        
                        VStack {
                            if candyLoseModel.currentIndex == 0 {
                                FirstWin(geometry: geometry, mainText: "NICE TRY BUT YOU LOSE\nYOU LOSSES:", textSize: 25) {
                                    candyLoseModel.currentIndex += 1
                                }
                            } else if candyLoseModel.currentIndex == 1 {
                                FirstWin(geometry: geometry,
                                         text: "+30",
                                         mainText: "NICE TRY BUT YOU LOSE\nYOU LOSSES:",
                                         textSize: 25,
                                         image: CandyImageName.starsImage.rawValue,
                                         sizeW: 0.23,
                                         sizeH: 0.115) {
                                    candyLoseModel.currentIndex += 1
                                }
                            } else {
                                SecondLose(geometry: geometry)
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
    CandyLoseView()
}

