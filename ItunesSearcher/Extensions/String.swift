//
//  String.swift
//  ItunesSearcher
//
//  Created by Михаил Звягинцев on 26.10.2021.
//
import Foundation

extension String {
    
    func getReleaseYear() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: self)
        guard let date = date else {
            return ""
        }
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: date)
    }
}

