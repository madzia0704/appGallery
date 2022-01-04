//
//  APIServiceProtocol.swift
//  AppGallery
//
//  Created by Magdalena Popińska on 19/12/2021.
//

import Foundation

protocol APIServiceProtocol {
    func fetchPhotos(url: URL?, completion: @escaping(Result<[Photo], APIError>) -> Void)
}
