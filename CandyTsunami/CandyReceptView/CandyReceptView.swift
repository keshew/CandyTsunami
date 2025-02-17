import SwiftUI

struct CandyReceptView: View {
    @StateObject var candyReceptModel =  CandyReceptViewModel()
    @Environment(\.presentationMode) var presentationMode
    var model: Recipe
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(.bgBlur)
                    .resizable()
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 0) {
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
                        
                        Image(.recipeLabel)
                            .resizable()
                            .frame(width: geometry.size.width * 0.67,
                                   height: geometry.size.height * 0.126)
                        
                        VStack(spacing: 20) {
                            Image(.recipe1)
                                .resizable()
                                .frame(width: geometry.size.width * 0.803,
                                       height: geometry.size.height * 0.2)
                            
                            ZStack {
                                Image(.recipeLabelBack)
                                    .resizable()
                                   
                                Text("Begin by dissolving strawberry jelly in boiling water, then add cold water and stir well. Pour this mixture into a cake pan and refrigerate until it sets firmly. Once set, repeat the process with orange jelly, gently pouring it over the strawberry layer to avoid mixing. Chill until the orange layer is set. Continue this process with lemon, lime, blueberry, and finally grape jelly, ensuring each layer is fully set before adding the next. After the final layer, chill the entire cake thoroughly. Slice and serve this vibrant dessert, perfect for any celebration.")
                                    .Demi(size: 18, outlineWidth: 0.7)
                                    .frame(width: geometry.size.width * 0.71,
                                           height: geometry.size.height * 0.344)
                                    .multilineTextAlignment(.center)
                                    .minimumScaleFactor(0.7)
                            }
                            .frame(width: geometry.size.width * 0.803,
                                   height: geometry.size.height * 0.444)
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let model = Recipe(image: "", closeImage: "", isOpen: false, desc: "")
    return CandyReceptView(model: model)
}

