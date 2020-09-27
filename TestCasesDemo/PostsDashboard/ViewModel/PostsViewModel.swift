//
//  PostsViewModel.swift
//  TestCasesDemo
//
//  Created by Shankar B S on 27/09/20.
//  Copyright © 2020 Slicode. All rights reserved.
//

import Foundation

//1
protocol PostNetworkDataManaging {
    func getPostItemsFrom(url: URL, completion: @escaping (Result<PostItems, NetworkError>)->())
}

//2
class PostsViewModel {
    //Replace with your own url
    //Visit: https://designer.mocky.io/design
    //Past given content and click on "GENERATE MY HTTP RESPONCE" and past the displayed url below
    private let postURL = "https://run.mocky.io/v3/95e9a94e-2352-43e6-ad21-f8cb7ab29d1f"
    
    private(set) var postItems: PostItems?
    
    var reloadBlock : (() -> (Void))?
    
    //3
    private let networkManager: PostNetworkDataManaging?
    
    //4
    init(with networkManager: PostNetworkDataManaging) {
        self.networkManager = networkManager
    }
    
    func getPostItems() {
        guard let url = URL(string: postURL) else { return }
        //5
        self.networkManager?.getPostItemsFrom(url: url, completion: {[weak self] result in
            if case let(.success(items)) = result {
                self?.postItems = items
            }
            self?.reloadBlock?()
        })
    }
    
    //6
    func numberOfPosts() -> Int {
        guard let postItems = self.postItems?.items else  {
            return 0
        }
        return postItems.count
    }
    
    func getCategoriesForPostAt(index: Int) -> [String]? {
        guard let postItems = self.postItems?.items, index < postItems.count , let categories = postItems[index].category else  {
            return nil
        }
        return categories
    }
    
    func postItemAt(index: Int) -> PostModel? {
        guard let postItems = self.postItems?.items,  index < postItems.count else  {
            return nil
        }
        return postItems[index]
    }
}
