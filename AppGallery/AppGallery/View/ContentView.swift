//
//  ContentView.swift
//  AppGallery
//
//  Created by Magdalena Popińska on 19/12/2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var photoService = PhotoService()
    var body: some View {
      
        if photoService.isLoading {
            LoadingView()
        // TODO: Handle errors, create error view
//        }else if photoService.errorMessage != nil  {
//            ErrorView
        }else {
            PhotoListView(photos: photoService.photos)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
