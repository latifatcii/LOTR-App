//
//  BookListViewController.swift
//  LOTR App
//
//  Created by Latif Atci on 7/7/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import UIKit

class BookListViewController: UIViewController {
    
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
    let activityIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadData()
        configureTableView()
        configureActivityIndicator()
    }
}
// Handle output from viewModel
extension BookListViewController: BookListViewModelDelegate {
    func handleViewModelOutput(_ output: BookListViewModelOutput) {
        DispatchQueue.main.async {
            switch output {
            case .setLoading(let loading):
                if loading {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
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
    
    private func configureActivityIndicator() {
        view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        activityIndicator.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        activityIndicator.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        activityIndicator.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
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
    
    
}
