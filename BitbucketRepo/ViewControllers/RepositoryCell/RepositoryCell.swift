//
//  RepositoryCell.swift
//  BitbucketRepo
//
//  Created by Thao Truong on 10/25/20.
//

import UIKit
import Kingfisher

class RepositoryCell: UITableViewCell {
    @IBOutlet weak var ownerImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var createdDateLabel: UILabel!
    
    var repository: Repository? {
        didSet {
            if let repository = repository {
                bindData(repository: repository)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ownerImageView.layer.cornerRadius = ownerImageView.frame.width/2
        ownerImageView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    private func bindData(repository: Repository) {
        nameLabel.text = repository.name
        typeLabel.text = repository.type
        createdDateLabel.text = repository.createdDate?.convertDateFormat(from: "yyyy-MM-dd'T'HH:mm:ss.SSSSSSXXX", to: "yyyy-MM-dd HH:mm:ss")
        if let avatarLink = repository.owner?.avatarLink {
            ownerImageView?.kf.setImage(
                with: URL(string: avatarLink),
                placeholder: Constants.Image.defaultAvatar
            )
        }
    }
}
