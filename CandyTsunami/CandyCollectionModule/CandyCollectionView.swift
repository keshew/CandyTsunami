import SwiftUI

struct CandyCollectionView: View {
    @StateObject var candyCollectionModel =  CandyCollectionViewModel()
    @Environment(\.presentationMode) var presentationMode
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
                        
                        Image(.collectionLabel)
                            .resizable()
                            .frame(width: 381, height: 107)
                        
                        Spacer(minLength: 30)
                        
                        if candyCollectionModel.currentIndex == 0 {
                            LazyVGrid(columns: candyCollectionModel.grid, spacing: 50) {
                                ForEach(candyCollectionModel.userDefaults.collectionItem.indices, id: \.self) { index in
                                    if candyCollectionModel.userDefaults.collectionItem[index].isOpen {
                                        NavigationLink(destination: CandyReceptView(model: candyCollectionModel.userDefaults.collectionItem[index])) {
                                            Image(candyCollectionModel.userDefaults.collectionItem[index].image)
                                                .resizable()
                                                .frame(width: 122, height: 124)
                                        }
                                    } else {
                                        Image(candyCollectionModel.userDefaults.collectionItem[index].closeImage)
                                            .resizable()
                                            .frame(width: 122, height: 124)
                                    }
                                }
                            }
                            
                        } else {
                            LazyVGrid(columns: candyCollectionModel.grid, spacing: 50) {
                                ForEach(candyCollectionModel.userDefaults.collectionItem2.indices, id: \.self) { index in
                                    if candyCollectionModel.userDefaults.collectionItem2[index].isOpen {
                                        NavigationLink(destination: CandyReceptView(model: candyCollectionModel.userDefaults.collectionItem2[index])) {
                                            Image(candyCollectionModel.userDefaults.collectionItem2[index].image)
                                                .resizable()
                                                .frame(width: 122, height: 124)
                                        }
                                    } else {
                                        Image(candyCollectionModel.userDefaults.collectionItem2[index].closeImage)
                                            .resizable()
                                            .frame(width: 122, height: 124)
                                    }
                                }
                            }
                        }
                        
                        Spacer(minLength: 230)
                        
                        Text(candyCollectionModel.currentIndex == 0 ? "SWIPE RIGHT TO NEXT PAGE" : "SWIPE LEFT TO PREV PAGE")
                            .Demi(size: 24)
                    }
                }
            }
            .gesture(
                DragGesture(minimumDistance: 0.0)
                    .onChanged({ value in
                        self.candyCollectionModel.offset = value.translation
                    })
                    .onEnded({ value in
                        if abs(value.translation.width) > abs(value.translation.height) {
                            if value.translation.width < -50 {
                                if candyCollectionModel.currentIndex != 0 {
                                    candyCollectionModel.currentIndex -= 1
                                }
                            } else if value.translation.width > 50 {
                                if candyCollectionModel.currentIndex != 1 {
                                    candyCollectionModel.currentIndex += 1
                                }
                            }
                        }
                        self.candyCollectionModel.offset = CGSize.zero
                    })
            )
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CandyCollectionView()
}

