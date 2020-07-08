//
//  BookListViewController.swift
//  LOTR App
//
//  Created by Latif Atci on 7/7/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import UIKit

class BookListViewController: BaseViewController {
    
    //TODO
    //Swipe delete
    //Refresh and update
    //Select index
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
        configureTableView()
    }
}
// Handle output from viewModel
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
}

extension BookListViewController {
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension BookListViewController: UITableViewDelegate {
    
}

extension BookListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookListCell", for: indexPath)
        cell.textLabel?.text = viewModel.books[indexPath.row].name
        cell.detailTextLabel?.text = viewModel.books[indexPath.row].id
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.deleteRow(at: indexPath)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
