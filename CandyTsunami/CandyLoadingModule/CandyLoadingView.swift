import SwiftUI

struct CandyLoadingView: View {
    @StateObject var candyLoadingModel =  CandyLoadingViewModel()
    @ObservedObject var audioManager = AudioManager.shared
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    Image(.bg)
                        .resizable()
                        .ignoresSafeArea()
                    
                    VStack {
                        Spacer()
                        
                        VStack {
                            Text("Loading...")
                                .Demi(size: 32)
                            
                            ZStack {
                                Rectangle()
                                    .fill(.white)
                                    .frame(width: geometry.size.width * 0.705,
                                           height: 18)
                                    .cornerRadius(10)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color(red: 192/255, green: 24/255, blue: 176/255),
                                                    lineWidth: 2.5)
                                    }
                                
                                Rectangle()
                                    .fill(Color(red: 247/255, green: 122/255, blue: 233/255))
                                    .frame(width: geometry.size.width * candyLoadingModel.contact.arrayOfHeight[candyLoadingModel.currentIndex], height: 16)
                                    .cornerRadius(10)
                                    .offset(x: geometry.size.width * candyLoadingModel.contact.arrayOfOffset[candyLoadingModel.currentIndex])
                            }
                        }
                    }
                }
          
            
            .onAppear {
                audioManager.playMenuMusic()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    candyLoadingModel.currentIndex += 1
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    candyLoadingModel.currentIndex += 1
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    candyLoadingModel.isMenu = true
                }
            }
            
            NavigationLink(destination: CandyMenuView(),
                           isActive: $candyLoadingModel.isMenu) {}
            .hidden()
        }
    }
    }
}

#Preview {
    CandyLoadingView()
}

