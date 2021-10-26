//
//  SearchAlbumsModel.swift
//  ItunesSearcher
//
//  Created by Михаил Звягинцев on 25.10.2021.
//

struct SearchAlbumsModel: Codable {

    let results: [SearchAlbumResult]
}

struct SearchAlbumResult: Codable {

    let collectionId: Int?
    let collectionName: String?
    let artworkUrl100: String?
    let artistName: String?
}
