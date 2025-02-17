import SwiftUI

struct CandySettingsView: View {
    @StateObject var candySettingsModel =  CandySettingsViewModel()
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var audioManager = AudioManager.shared
    
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
                        }
                        
                        Image(.settingsLabel)
                            .resizable()
                            .frame(width: geometry.size.width * 0.76,
                                   height: geometry.size.height * 0.124)
                        
                        ZStack {
                            Image(.settingsLabelBack)
                                .resizable()
                            
                            VStack(spacing: 30) {
                                VStack(spacing: 20) {
                                    Text("SOUND AND MUSIC ")
                                        .Demi(size: 25)
                                    
                                    HStack(spacing: 60) {
                                        Button(action: {
                                            candySettingsModel.isMusicOff.toggle()
                                            
                                            if candySettingsModel.isMusicOff {
                                                UserDefaultsManager().saveVolumeSettings(backgroundVolume: 0)
                                                audioManager.backgroundVolume = 0
                                            } else {
                                                UserDefaultsManager().saveVolumeSettings(backgroundVolume: 1)
                                                audioManager.backgroundVolume = 1
                                            }
                                            
                                        }) {
                                            Image(candySettingsModel.isMusicOff ? CandyImageName.musicOff.rawValue : CandyImageName.music.rawValue)
                                                .resizable()
                                                .frame(width: geometry.size.width * 0.266,
                                                       height: geometry.size.height * 0.134)
                                        }
                                        
                                        Button(action: {
                                            candySettingsModel.isSoundOff.toggle()
                                        }) {
                                            Image(candySettingsModel.isSoundOff ? CandyImageName.soundOff.rawValue : CandyImageName.sound.rawValue)
                                                .resizable()
                                                .frame(width: geometry.size.width * 0.266,
                                                       height: geometry.size.height * 0.134)
                                        }
                                    }
                                    Text("RESET ALL PROGRESS")
                                        .Demi(size: 25)
                                }
                                
                                Button(action: {
                                    UserDefaultsManager().resetAll()
                                }) {
                                    ZStack {
                                        Image(.backForPlayButton)
                                            .resizable()
                                            .frame(width: geometry.size.width * 0.547,
                                                   height: geometry.size.height * 0.1135)
                                        
                                        Text("RESET")
                                            .Demi(size: 30)
                                    }
                                }
                                Spacer()
                            }
                            .padding(.top, 30)
                            
                        }
                        .frame(width: geometry.size.width * 0.912,
                               height: geometry.size.height * 0.545)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CandySettingsView()
}

