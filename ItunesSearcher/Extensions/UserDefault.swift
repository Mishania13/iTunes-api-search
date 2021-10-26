//
//  UserDefault.swift
//  ItunesSearcher
//
//  Created by Михаил Звягинцев on 26.10.2021.
//

import Foundation

extension UserDefaults {

    func addResultToSearchHistory(result: String) {
        if var results = self.object(forKey: "Search") as? [String] {
            guard !results.contains(result.capitalized) else {return}
            self.removeObject(forKey: "Search")
            results.append(result.capitalized)
            self.set(results, forKey: "Search")
            return
        }
        self.set([result.capitalized], forKey: "Search")
    }

    func getSearchHistory() -> [String] {
        if let results = self.object(forKey: "Search") as? [String] {
            return results
        }
        return []
    }
}
