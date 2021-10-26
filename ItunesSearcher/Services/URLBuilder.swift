//
//  URLBuilder.swift
//  ItunesSearcher
//
//  Created by Михаил Звягинцев on 25.10.2021.
//

import Foundation

class URLBuilder {
    
    func buildAlbumsSearch(searchText: String) -> URL? {
        var components = URLComponents()
        let searchAlbumsLimit = 60
        components.scheme = BaseURLs.scheme.rawValue
        components.host = BaseURLs.baseUrl.rawValue
        components.path = BaseURLs.searchAlbumsPath.rawValue
        let querySearchType = URLQueryItem(name: BaseURLs.querySearchEntity.rawValue,
                                           value: SearchEntities.album.rawValue)
        let querySearchText = URLQueryItem(name: BaseURLs.querySearchAlbumText.rawValue,
                                           value: searchText)
        let queryResultCount = URLQueryItem(name: BaseURLs.queryResultCount.rawValue,
                                            value: String(searchAlbumsLimit))
        components.queryItems = [querySearchType, querySearchText, queryResultCount]
        return components.url
    }
    
    func buildAlbumDetailsSearch(albumID id: Int) -> URL? {
        var components = URLComponents()
        components.scheme = BaseURLs.scheme.rawValue
        components.host = BaseURLs.baseUrl.rawValue
        components.path = BaseURLs.searchSongsPath.rawValue
        let querySearchType = URLQueryItem(name: BaseURLs.querySearchEntity.rawValue,
                                           value: SearchEntities.albumSongs.rawValue)
        let querySongsAlbumID = URLQueryItem(name: BaseURLs.querySongsAlbumId.rawValue,
                                             value: String(id))
        components.queryItems = [querySongsAlbumID, querySearchType]

        return components.url
    }
}

fileprivate enum BaseURLs: String {
    
    case scheme = "https"
    case baseUrl = "itunes.apple.com"
    case querySearchEntity = "entity"
    
    case searchAlbumsPath = "/search"
    case querySearchAlbumText = "term"
    case queryResultCount = "limit"
    
    case searchSongsPath = "/lookup"
    case querySongsAlbumId = "id"
}

fileprivate enum SearchEntities: String {
    case album = "album"
    case albumSongs = "song"
}
