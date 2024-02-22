//
//  GifsModel.swift
//  GifsGenerator
//
//  Created by Suttroogun Yogin on 22/02/2024.
//

import Foundation

struct RandomGiphyResponse: Codable {
    let data: Gif
}

struct Gif: Codable {
    let images: GifImages
}

struct GifImages: Codable {
    let fixed_height: GifUrl
}

struct GifUrl: Codable {
    let url: String
}
