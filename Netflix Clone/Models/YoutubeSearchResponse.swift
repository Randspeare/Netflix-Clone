//
//  YoutubeSearchResponse.swift
//  Netflix Clone
//
//  Created by Ana Naomi Erlandez on 3/25/24.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String?
}

