import SwiftUI

struct CandyRulesView: View {
    @StateObject var CandyRulesModel =  CandyRulesViewModel()
    @Binding var isRules: Bool
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(.black)
                    .ignoresSafeArea()
                    .opacity(0.5)
                
                ScrollView {
                    VStack {
                        Spacer(minLength: 70)
                        
                        Image(.rulesLabel)
                            .resizable()
                            .frame(width: geometry.size.width * 0.655,
                                   height: geometry.size.height * 0.13)
                        
                        Spacer(minLength: 50)
                        ZStack {
                            Image(.rulesLabelBackground)
                                .resizable()
                            
                            VStack {
                                Text("BONUS TIME")
                                    .Demi(size: 40)
                                
                                Image(.bonusTime)
                                    .resizable()
                                    .frame(width: 64, height: 73)
                                
                                Text("GIVES YOU\nADDITIONAL 30\nSECONDS TO PLAY")
                                    .Demi(size: 20)
                                    .multilineTextAlignment(.center)
                                
                                Text("BONUS STEPS")
                                    .Demi(size: 40)
                                
                                Image(.bonusStep)
                                    .resizable()
                                    .frame(width: 70, height: 73)
                                
                                Text("GIVES YOU\nADDITIONAL 4 STEPS\nTO PLAY")
                                    .Demi(size: 20)
                                    .multilineTextAlignment(.center)
                            }
                            .offset(y: -20)
                              
                            
                            Button(action: {
                                isRules = false
                            }) {
                                ZStack {
                                    Image(.backForPlayButton)
                                        .resizable()
                                        .frame(width: geometry.size.width * 0.403,
                                               height: geometry.size.height * 0.084)
                                    
                                    Text("BACK TO\nGAME")
                                        .Demi(size: 20, outlineWidth: 0.6)
                                }
                            }
                            .offset(y: geometry.size.height * 0.2861)
                        }
                        .frame(width: geometry.size.width * 0.803,
                               height: geometry.size.height * 0.585)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    @State var isRules = false
    return CandyRulesView(isRules: $isRules)
}

