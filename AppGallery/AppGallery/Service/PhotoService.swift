//
//  ImageService.swift
//  AppGallery
//
//  Created by Magdalena Popińska on 19/12/2021.
//

import Foundation
import SwiftUI

class PhotoService: ObservableObject {
    
    @Published var photos = [PhotoListItem]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    let service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
        fetchPhotos()
    }
    
    func fetchPhotos() {
        
        isLoading = true
        errorMessage = nil
        
        let url = URL(string: "\(Constants.BaseUrl)/v2/list")
        service.fetchPhotos(url: url) { [unowned self] result in
            
            DispatchQueue.main.async {
                
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    #if DEBUG
                        print(error.description)
                    #endif
                    self.isLoading = false
                    print(error)
                case .success(let photos):
                    #if DEBUG
                        print("--- sucess with \(photos.count)")
                    #endif
                    let photos = photos.map { PhotoListItem(photo: $0)}
                    
                    let dispatchGroup = DispatchGroup()
                    var countSuccess = 0
                    photos.forEach({ photo in
                            dispatchGroup.enter()
                        downloadImage(url: photo.thumbnailUrl) { int in
                            countSuccess = countSuccess + int + 1
                            dispatchGroup.leave()
                            }
                        })
                    dispatchGroup.notify(queue: .main, execute: {
                        self.photos = photos
                        self.isLoading = false
                    })
                }
            }
        }
        
    }
    
    // TODO: move request to service
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
