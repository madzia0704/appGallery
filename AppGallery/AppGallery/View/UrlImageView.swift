//
//  UrlImageView.swift
//  AppGallery
//
//  Created by Magdalena Popińska on 19/12/2021.
//

import SwiftUI

struct UrlImageView: View {
    @ObservedObject var urlImageModel: UrlImageModel
    
    init(urlString: String?) {
        urlImageModel = UrlImageModel(urlString: urlString)
    }
    
    var body: some View {
        Image(uiImage: urlImageModel.image ?? UrlImageView.defaultImage!)
            .resizable()
            .scaledToFit()
            .padding(4)
    }
    
    static var defaultImage = UIImage(named: Constants.ImageName.BlackImg.rawValue)
}

struct UrlImageView_Previews: PreviewProvider {
    static var previews: some View {
        UrlImageView(urlString: nil)
    }
}
