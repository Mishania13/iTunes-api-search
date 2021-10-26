//
//  SearchMusicConfigurator.swift
//  ItunesSearcher
//
//  Created by Михаил Звягинцев on 25.10.2021.
//

import UIKit

final class SearchMusicConfigurator {

    static let shared = SearchMusicConfigurator()

    private init() {}
    
    func configure(with viewController: SearchMusicViewController) {
        let viewController = viewController
        let interactor = SearchMusicInteractor()
        let presenter = SearchMusicPresenter()
        let router = SearchMusicRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
