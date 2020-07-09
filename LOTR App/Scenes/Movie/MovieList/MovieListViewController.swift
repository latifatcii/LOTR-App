//
//  MovieListViewController.swift
//  LOTR App
//
//  Created by Latif Atci on 7/9/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import UIKit

class MovieListViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: MovieListViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadData()
        configureTableView()
        tableView.refreshControl = refreshController
        configureRefreshController()
    }
}
//MARK: - Handle viewModels output
extension MovieListViewController: MovieListViewModelDelegate {
    
    func handleViewModelOutput(_ output: MovieListViewModelOutput) {
        DispatchQueue.main.async {
            switch output {
            case .setLoading(let loading):
                self.setActivityIndicatorAnimation(with: loading)
            case .showMovieList:
                self.tableView.reloadData()
            case .error(let error):
                self.showAlert(with: "Error!!", error.rawValue)
            }
        }
        
    }
}
//MARK: - UI Setups
extension MovieListViewController {
    
    private func configureTableView() {
        tableView.dataSource = self
        //        tableView.delegate = self
    }
    
    private func configureRefreshController() {
        refreshController.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    @objc func refresh() {
        viewModel.refreshData()
        tableView.reloadData()
        refreshController.endRefreshing()
    }
}

extension MovieListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListCell", for: indexPath)
        cell.textLabel?.text = viewModel.movie[indexPath.row].name
        cell.detailTextLabel?.text = viewModel.movie[indexPath.row].id
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.deleteRow(at: indexPath)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
