//
//  Data.swift
//  ItunesSearcher
//
//  Created by Михаил Звягинцев on 26.10.2021.
//

import UIKit

extension Data {
    func getImage() -> UIImage {
        return UIImage(data: self) ?? UIImage(systemName: "nosign")!
    }
}
