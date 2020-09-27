//
//  PostsDashboardViewController.swift
//  TestCasesDemo
//
//  Created by Shankar B S on 27/09/20.
//  Copyright © 2020 Slicode. All rights reserved.
//

import Foundation
import UIKit

class PostsDashboardViewController: UIViewController {
    @IBOutlet weak var postsTableView: UITableView!
    private let CellReuseID = "PostCell"
    let viewModel = PostsViewModel(with: NetworkManager())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.reloadBlock = { [weak self] in
            DispatchQueue.main.async {
                self?.postsTableView.reloadData()
            }
        }
        viewModel.getPostItems()
        self.postsTableView.register(UINib(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: CellReuseID)
    }
}

extension PostsDashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfPosts()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseID) as? PostCell else {
            return UITableViewCell()
        }
        let postModel = viewModel.postItemAt(index: indexPath.row)
        if let model = postModel {
            cell.configureCellWith(postModel: model)
        }
        return cell
    }
}
