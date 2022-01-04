//
//  Photo.swift
//  AppGallery
//
//  Created by Magdalena Popińska on 19/12/2021.
//

import Foundation

struct Photo: Codable, Identifiable {
    var id: String
    var author: String
    var width: Int
    var height: Int
    var url: String
    var download_url: String
}
