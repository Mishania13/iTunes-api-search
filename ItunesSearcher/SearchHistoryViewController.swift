//
//  SearchHistoryViewController.swift
//  ItunesSearcher
//
//  Created by Михаил Звягинцев on 26.10.2021.
//

import UIKit

class SearchHistoryViewController: UIViewController {

    private var searchHistory: [String] {
        let userDefaults = UserDefaults.standard
        return userDefaults.getSearchHistory()
    }

    private var tableView = UITableView()
    private let cellID = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(tableView)
        tableView.frame = view.frame
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.delegate = self
        tableView.dataSource = self
        title = "Search History"
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
}

extension SearchHistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchHistory.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = searchHistory.reversed()[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let navController = tabBarController?.viewControllers?.first as? UINavigationController else {return}
        guard let searchController = navController.viewControllers.first as? SearchMusicViewController else {return}
        searchController.interactor?.searchAlbums(
            request: SearchMusic.SearchAlbums.Request.init(searchText: searchHistory.reversed()[indexPath.row])
        )
        searchController.searchFromHistory()
        tabBarController?.selectedIndex = 0
        if navController.viewControllers.count == 2,
            let detailsVC = navController.viewControllers[1] as? AlbumDetailsViewController {
            detailsVC.navigationController?.popViewController(animated: true)
        }
    }
}
