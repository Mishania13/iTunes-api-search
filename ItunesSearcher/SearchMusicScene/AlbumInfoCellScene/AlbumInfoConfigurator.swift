//
//  AlbumInfoConfigurator.swift
//  ItunesSearcher
//
//  Created by Михаил Звягинцев on 25.10.2021.
//

import UIKit

final class AlbumInfoConfigurator {
    
    static let shared = AlbumInfoConfigurator()
    
    private init() {}
    
    func configure(with viewController: AlbumInfoCollectionViewCell) {

          let viewController = viewController
          let interactor = AlbumInfoInteractor()
          let presenter = AlbumInfoPresenter()
          viewController.interactor = interactor
          interactor.presenter = presenter
          presenter.viewController = viewController
    }
}
