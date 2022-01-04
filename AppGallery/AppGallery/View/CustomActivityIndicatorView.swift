//
//  CustomActivityIndicatorView.swift
//  AppGallery
//
//  Created by Magdalena Popińska on 02/01/2022.
//

import SwiftUI

struct CustomActivityIndicatorView : View {
    @State var angle: Double = 0.0
    @State var isAnimating = false
    
    var foreverAnimation: Animation {
        Animation.linear(duration: 0.5)
            .repeatForever(autoreverses: false)
    }
    
    var body: some View {
        Image(uiImage: UIImage(named: Constants.ImageName.WaitEmoji.rawValue)!)
            .resizable().frame(width: 50, height: 50, alignment: .center)
            .rotationEffect(Angle(degrees: self.isAnimating ? 360.0 : 0.0))
            .animation(self.foreverAnimation, value: self.isAnimating)
            .onAppear {
                self.isAnimating = true
        }
    }
}
