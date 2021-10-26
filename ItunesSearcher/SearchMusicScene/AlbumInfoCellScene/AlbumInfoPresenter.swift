//
//  AlbumInfoPresenter.swift
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

protocol AlbumInfoPresentationLogic {
    func presentAlbumImage(response: AlbumInfo.ShowAlbumCellCell.Response)
    func presentDefaultImage()
}

class AlbumInfoPresenter: AlbumInfoPresentationLogic {
    
    weak var viewController: AlbumInfoDisplayLogic?

    func presentDefaultImage() {
        viewController?.displayDefaultImage()
    }
    func presentAlbumImage(response: AlbumInfo.ShowAlbumCellCell.Response) {
        let viewModel = AlbumInfo.ShowAlbumCellCell.ViewModel(imageData: response.imageData)
        viewController?.displayAlbumImage(viewModel: viewModel)
    }
}