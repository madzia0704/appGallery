//
//  LoadingView.swift
//  AppGallery
//
//  Created by Magdalena Popińska on 19/12/2021.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 40)  {
            CustomActivityIndicatorView()
            Text("Loading ...")
                .foregroundColor(.blue)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
