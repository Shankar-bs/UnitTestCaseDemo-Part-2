//
//  PostsViewModelTests.swift
//  TestCasesDemoTests
//
//  Created by Shankar B S on 27/09/20.
//  Copyright © 2020 Slicode. All rights reserved.
//

import Foundation

import XCTest
@testable import TestCasesDemo

class PostsViewModelTests: XCTestCase {
    func testPostViewModelForValidResponse() {
        let mockNetworkManager = MockNetworkManager(with: .validResponse)
        let viewModel = PostsViewModel(with: mockNetworkManager)
        viewModel.getPostItems()
        XCTAssertTrue(viewModel.numberOfPosts() == 4)
    }
    
    func testPostViewModelForEmptyCategory() {
        let mockNetworkManager = MockNetworkManager(with: .emptyCategoryResponse)
        let viewModel = PostsViewModel(with: mockNetworkManager)
        viewModel.getPostItems()
        let categoriesCount = viewModel.getCategoriesForPostAt(index: 0)?.count
        XCTAssertTrue(categoriesCount == 0)
    }
}
