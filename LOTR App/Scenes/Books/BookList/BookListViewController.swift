//
//  BookListViewController.swift
//  LOTR App
//
//  Created by Latif Atci on 7/7/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import UIKit

class BookListViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    //Sets viewModels delegate
    var viewModel: BookListViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadData()
        tableView.refreshControl = refreshController
        configureRefreshController()
        tableView.register(UINib(nibName: "BaseTableViewCell", bundle: nil), forCellReuseIdentifier: "BaseTableViewCell")
    }
}
//MARK: - Handle viewModels output
extension BookListViewController: BookListViewModelDelegate {
    
    func handleViewModelOutput(_ output: BookListViewModelOutput) {
        DispatchQueue.main.async {
            switch output {
            case .setLoading(let loading):
                self.setActivityIndicatorAnimation(with: loading)
            case .showBookList:
                self.tableView.reloadData()
            case .error(let error):
                self.showAlert(with: "Error!!", error.rawValue)
            }
        }
    }
    
    func bookSceneRouter(_ router: BookListRouter) {
        switch router {
        case .bookListDetails(let viewM):
            let vc = BookListDetailSceneBuilder.build(with: viewM)
            show(vc, sender: nil)
        }
    }
}
//MARK: - UI Setups
extension BookListViewController {
    
    private func configureRefreshController() {
        refreshController.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    @objc func refresh() {
        viewModel.refreshData()
        tableView.reloadData()
        refreshController.endRefreshing()
    }
}

extension BookListViewController: UITableViewDataSource, BaseCellDelegate {
    func favButtonTapped(indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? BaseTableViewCell
        
        viewModel.checkIfBookFavorited(at: indexPath.row) { [weak self] (isFav) in
            guard let self = self else { return }
            
            if isFav {
                self.viewModel.unFavBook(at: indexPath.row)
            } else {
                self.viewModel.favBook(at: indexPath.row)
            }

            cell?.switchFavButtonImage(isDataFavorited: isFav)
            self.tableView.reloadRows(at: [indexPath], with: .fade)
        }

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BaseTableViewCell", for: indexPath) as? BaseTableViewCell else { return UITableViewCell() }
        
        viewModel.checkIfBookFavorited(at: indexPath.row) { (isFav) in
            cell.switchFavButtonImage(isDataFavorited: isFav)
        }
        
        cell.nameLabel.text = viewModel.books[indexPath.row].name
        cell.idLabel.text = viewModel.books[indexPath.row].id
        cell.index = indexPath
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

extension BookListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.selectBook(at: indexPath.row)
    }
}
