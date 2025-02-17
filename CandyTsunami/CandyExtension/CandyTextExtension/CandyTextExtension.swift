import SwiftUI

extension Text {
    func Demi(size: CGFloat,
                color: Color = .white,
              outlineWidth: CGFloat = 1,
               colorOutline: Color = Color(red: 192/255, green: 24/255, blue: 176/255)) -> some View {
        self.font(.custom("FranklinGothic-Demi", size: size))
            .foregroundColor(color)
            .outlineText(color: colorOutline, width: outlineWidth)
    }
    
   
}

