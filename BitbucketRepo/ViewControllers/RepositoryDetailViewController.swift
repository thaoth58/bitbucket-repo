//
//  RepositoryDetailViewController.swift
//  BitbucketRepo
//
//  Created by Thao Truong on 10/26/20.
//

import UIKit

class RepositoryDetailViewController: UIViewController {

    var repository: Repository?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        title = repository?.name
    }
}
