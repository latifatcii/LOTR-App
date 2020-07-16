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
            case .isBookFavorited(let isBookFavorited):
                print(isBookFavorited)
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

extension BookListViewController: UITableViewDataSource, BookListCellDelagete {
    func favButtonTapped(indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? BookListCell
        cell?.switchFavButtonImage()
        viewModel.checkIfBookFavorited(at: indexPath.row)
        viewModel.favBook(at: indexPath.row)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookListCell", for: indexPath) as? BookListCell else { return UITableViewCell() }
        
        cell.nameLabel?.text = viewModel.books[indexPath.row].name
        cell.idLabel?.text = viewModel.books[indexPath.row].id
        cell.delegate = self
        cell.index = indexPath
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
