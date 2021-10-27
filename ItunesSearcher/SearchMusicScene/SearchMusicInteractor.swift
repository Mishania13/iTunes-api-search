//
//  SearchMusicInteractor.swift
//  ItunesSearcher
//
//  Created by Михаил Звягинцев on 25.10.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol SearchMusicBusinessLogic {

    func searchAlbums(request: SearchMusic.SearchAlbums.Request)
}

protocol SearchMusicDataStore {

    var albumIDs: [Int] { get set }
}

class SearchMusicInteractor: SearchMusicBusinessLogic, SearchMusicDataStore {

    var presenter: SearchMusicPresentationLogic?
    var albumIDs: [Int] = []
    private var lastSearch = ""
    
    func searchAlbums(request: SearchMusic.SearchAlbums.Request) {
        guard lastSearch != request.searchText.capitalized else {
            presenter?.stopActivityIndicator()
            return
        }
        lastSearch = request.searchText.capitalized
        guard let url = URLBuilder().buildAlbumsSearch(searchText: request.searchText) else {
            presenter?.presentAlert(error: CustomErrors.searchResultEmpty)
            return
        }
        NetworkManager.shared.fetchData(from: url, resultType: SearchAlbumsModel.self) { result in
            do {
                let albumsData = try result.get().results
                guard !albumsData.isEmpty else {
                    self.presenter?.presentAlert(error: CustomErrors.searchResultEmpty)
                    return
                }
                ImageDataLoader.shared.clearCache()
                let userDefault = UserDefaults.standard
                userDefault.addResultToSearchHistory(result: request.searchText)
                
                self.albumIDs = []
                let response = SearchMusic.SearchAlbums.Response(albumsData: albumsData)
                self.presenter?.presentAlbums(response: response)
                response.albumsData.forEach{self.albumIDs.append($0.collectionId ?? 0)}
            } catch {
                self.presenter?.presentAlert(error: error)
            }
        }
    }
}
