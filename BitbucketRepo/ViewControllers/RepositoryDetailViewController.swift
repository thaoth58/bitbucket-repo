//
//  RepositoryDetailViewController.swift
//  BitbucketRepo
//
//  Created by Thao Truong on 10/26/20.
//

import UIKit

class RepositoryDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    
    var repository: Repository?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bindData()
    }
    
    private func setupView() {
        title = repository?.name
    }
    
    // MARK: Data Binding
    func bindData() {
        nameLabel.text = repository?.name?.displayText()
        typeLabel.text = repository?.type?.displayText() ?? "N/A"
        if let website = repository?.website, !website.isEmpty {
            let linkAttributes = [
                NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue,
                NSAttributedString.Key.foregroundColor: UIColor.blue
            ] as [NSAttributedString.Key : Any]
            
            let linkAttributedString = NSAttributedString(string: website, attributes: linkAttributes)
            websiteLabel.attributedText = linkAttributedString
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.didTapWebsite(_:)))
            websiteLabel.addGestureRecognizer(tapGesture)
            websiteLabel.isUserInteractionEnabled = true
        } else {
            websiteLabel.text = "N/A"
        }
        languageLabel.text = repository?.language?.displayText() ?? "N/A"
    }
    
    // MARK: Action
    @objc func didTapWebsite(_ sender: UITapGestureRecognizer? = nil) {
        guard let webVC = storyboard?.instantiateViewController(identifier: Constants.ViewControllerIdentifier.webview) as? WebViewController else { return }
        webVC.link = repository?.website
        present(webVC, animated: true, completion: nil)
    }
}
