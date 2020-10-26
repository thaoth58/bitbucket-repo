//
//  ListRepositoryViewController.swift
//  BitbucketRepo
//
//  Created by Thao Truong on 10/25/20.
//

import UIKit

class ListRepositoryViewController: UIViewController {

    @IBOutlet weak var repositoryTableView: UITableView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var loadingView: UIView!
    
    private var repositories: [Repository] = []
    private var nextURL: String? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                if let newURL = self?.nextURL, !newURL.isEmpty {
                    // Show button Next
                    self?.nextButton.isHidden = false
                } else {
                    // Hide button Next
                    self?.nextButton.isHidden = true
                }
            }
        }
    }
    
    private let cellIdentifier = "repositoryCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        // Get data from base URL once
        getListRepository()
    }

    private func setupView() {
        // Remove unnecessary seperation lines
        repositoryTableView.tableFooterView = UIView()
    }
    
    // MARK: Button Action
    @IBAction func didTapNextButton(_ sender: Any) {
        if let nextURL = nextURL {
            getListRepository(url: nextURL)
        }
    }
    
    // MARK: Data processing
    private func getListRepository(url: String = baseURL) {
        loadingView.isHidden = false
        NetworkManager.shared.getListRepository(url: url) { [weak self] (repositoryResponse, errorDesc) in
            if let response = repositoryResponse {
                self?.repositories = response.repositories
                self?.nextURL = response.next
            }
            DispatchQueue.main.async {
                self?.repositoryTableView.reloadData()
                self?.loadingView.isHidden = true
            }
        }
    }
}

// MARK: TableView
extension ListRepositoryViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RepositoryCell {
            let repository = repositories[indexPath.row]
            cell.repository = repository
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let detailVC = storyboard?.instantiateViewController(identifier: Constants.ViewControllerIdentifier.repositoryDetail) as? RepositoryDetailViewController else { return }
        
        detailVC.repository = repositories[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
