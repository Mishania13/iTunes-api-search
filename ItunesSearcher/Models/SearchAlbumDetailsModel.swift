//
//  SearchAlbumSongsModel.swift
//  ItunesSearcher
//
//  Created by Михаил Звягинцев on 25.10.2021.
//

import Foundation

struct SearchAlbumDetailsModel: Codable {

    let results: [SearchAlbumSongsResults]
}

struct SearchAlbumSongsResults: Codable {
    
    let artistName: String?
    let trackName: String?
    let primaryGenreName: String?
    let releaseDate: String?
    let artworkUrl100: String?
    let collectionName: String?
}
