//
//  PostCell.swift
//  TestCasesDemo
//
//  Created by Shankar B S on 27/09/20.
//  Copyright © 2020 Slicode. All rights reserved.
//

import Foundation
import UIKit

class PostCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func configureCellWith(postModel: PostModel) {
        self.titleLabel.text = postModel.title
        self.descriptionLabel.text = postModel.description
        self.categoriesLabel.text = "Categories: \(postModel.category?.joined(separator: ",") ?? "")"
    }
}
