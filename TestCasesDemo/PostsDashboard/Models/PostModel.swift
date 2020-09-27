//
//  PostModel.swift
//  TestCasesDemo
//
//  Created by Shankar B S on 27/09/20.
//  Copyright © 2020 Slicode. All rights reserved.
//

import Foundation

struct PostItems: Decodable {
    let items: [PostModel]?
}

struct  PostModel: Decodable {
    let title: String?
    let description: String?
    let postId: Int?
    let category: [String]?
}
