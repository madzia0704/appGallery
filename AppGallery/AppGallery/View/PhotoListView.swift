//
//  ImageList.swift
//  AppGallery
//
//  Created by Magdalena Popińska on 19/12/2021.
//

import SwiftUI

struct PhotoListView: View {
    let photos: [PhotoListItem]
    var columns: [GridItem] {
      Array(repeating: .init(.adaptive(minimum: 120)), count: 2)
    }
    var body: some View {
        ZStack {
            if photos.count == 0 {
                Text("No data loaded")
            } else {
                NavigationView {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 5) {
                            ForEach(photos, id: \.id) { photo in
                                NavigationLink(destination: PhotoDetailsView(photo: photo)) {
                                    VStack {
                                        UrlImageView(urlString: photo.thumbnailUrl)
                                    }
                                }
                            }
                        }
                    }.listStyle(PlainListStyle()).navigationTitle("Fourthwall gallery")
                }
            }
        }
    }
}

struct ImageListView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoListView(photos: [])
    }
}
