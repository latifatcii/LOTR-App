//
//  FavoritesViewController.swift
//  LOTR App
//
//  Created by Latif Atci on 7/14/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import UIKit

final class FavoritesViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: FavoritesViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchData()
        tableView.refreshControl = refreshController
        configureRefreshController()
    }
}
extension FavoritesViewController {
    
    private func configureRefreshController() {
        refreshController.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    @objc func refresh() {
        viewModel.fetchData()
        tableView.reloadData()
        refreshController.endRefreshing()
    }
}

extension FavoritesViewController: FavoritesViewModelDelegate {
    
    func handleViewModelOutput(_ output: FavoritesViewModelOutput) {
        switch output {
        case .loading(let loading):
            setActivityIndicatorAnimation(with: loading)
        case .error(let persistanceError):
            showAlert(with: "Error!!", persistanceError.rawValue)
        }
    }
}

extension FavoritesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.favBooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesCell", for: indexPath)
        cell.textLabel?.text = viewModel.favBooks[indexPath.row].name
        
        return cell
    }
}

extension FavoritesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.removeData(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
