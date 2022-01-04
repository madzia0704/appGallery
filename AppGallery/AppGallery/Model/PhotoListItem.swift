//
//  PhotoListItem.swift
//  AppGallery
//
//  Created by Magdalena Popińska on 19/12/2021.
//

import Foundation
import SwiftUI

class PhotoListItem {
    var id: String
    var author: String
    var thumbnailUrl: String
    var imageUrl: String
    init(photo: Photo) {
        id = photo.id
        author = photo.author
        imageUrl = photo.download_url
        thumbnailUrl = PhotoListItem.getThumbnailUrl(photo: photo)
    }
    
    static func getThumbnailUrl(photo: Photo) -> String {
        let size = min(photo.width, photo.height, max(Int(UIScreen.main.bounds.width), Int(UIScreen.main.bounds.height)))
        return "\(Constants.BaseUrl)/id/\(photo.id)/\(String(size))"
    }
    
    func getThumbnail() -> UIImage? {
        return ImageCache.getImageCache().get(forKey: thumbnailUrl)
    }
    
    func getImage() -> UIImage? {
        return ImageCache.getImageCache().get(forKey: imageUrl)
    }
    
    // TODO: move request to APIService
    func downloadImage(url: String, completion: @escaping (Int) -> ()) {
        guard let imageUrl = URL(string: url) else {
            return
        }
        URLSession.shared.dataTask(with: imageUrl) { data, _, error in
            guard let data = data, error == nil else {
                completion(-1)
                return
            }
            DispatchQueue.main.async {
                guard let image = UIImage(data: data) else {
                    completion(-1)
                    return

                }
                ImageCache.getImageCache().set(forKey: url, image: image)
                completion(0)
            }
        }.resume()
    }
}
