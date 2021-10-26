//
//  AlbumDetailsConfigurator.swift
//  ItunesSearcher
//
//  Created by Михаил Звягинцев on 26.10.2021.
//

import Foundation


final class AlbumDetailsConfigurator {

    static let shared = AlbumDetailsConfigurator()

    private init() {}

    func configure(with viewController: AlbumDetailsViewController) {
        let viewController = viewController
        let interactor = AlbumDetailsInteractor()
        let presenter = AlbumDetailsPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
}
