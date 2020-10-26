//
//  WebViewController.swift
//  BitbucketRepo
//
//  Created by Thao Truong on 10/26/20.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var link: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
    }
    
    func bindData() {
        if let link = link, let url = URL(string: link) {
            webView.load(URLRequest(url: url))
        }
    }
    
    // MARK: Action
    @IBAction func didTapCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
