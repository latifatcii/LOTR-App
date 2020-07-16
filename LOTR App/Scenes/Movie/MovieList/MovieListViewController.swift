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
    
    func movieSceneRouter(_ router: MovieListRouter) {
        switch router {
        case .movieListDetails(let vm):
            let vc = MovieListDetailSceneBuilder.build(with: vm)
            show(vc, sender: nil)
        }
    }
}
//MARK: - UI Setups
extension MovieListViewController {

    
    private func configureRefreshController() {
        refreshController.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    @objc func refresh() {
        viewModel.refreshData()
        tableView.reloadData()
        refreshController.endRefreshing()
    }
}

extension MovieListViewController: UITableViewDataSource, BookListCellDelegate {
    
    func favButtonTapped(indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? MovieListCell
        
        viewModel.checkIfMovieFavorited(at: indexPath.row) { [weak self] (isFavorited) in
            guard let self = self else { return }
            
            if isFavorited {
                self.viewModel.unFavBook(at: indexPath.row)
            } else {
                self.viewModel.favMovie(at: indexPath.row)
            }
            
            cell?.switchFavButtonImage(isMovieFavorited: isFavorited)
            self.tableView.reloadRows(at: [indexPath], with: .fade)
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListCell", for: indexPath) as? MovieListCell else { return UITableViewCell() }
        
        viewModel.checkIfMovieFavorited(at: indexPath.row) { (isFavorited) in
            cell.switchFavButtonImage(isMovieFavorited: isFavorited)
        }
        cell.configureCellOutlets(movie: viewModel.movie[indexPath.row], index: indexPath)
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.deleteRow(at: indexPath)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}

extension MovieListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectMovie(at: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
