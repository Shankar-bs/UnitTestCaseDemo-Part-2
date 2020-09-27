//
//  MockNetworkManager.swift
//  TestCasesDemoTests
//
//  Created by Shankar B S on 27/09/20.
//  Copyright © 2020 Slicode. All rights reserved.
//

import Foundation
import XCTest
@testable import TestCasesDemo

//1
enum ResponseType {
    case validResponse
    case emptyResponse
    case invalidResponse
    case errorResponse
    case emptyCategoryResponse
    case emptyTitleResponse
    case emptyDescriptionResponse
    //rest of the edge case senario that you expect from server side
    
    func getResponse() -> String {
        switch self {
        case .validResponse:
            return MockData.validResponse
        case .emptyResponse:
            return MockData.emptyResponse
        case .invalidResponse:
            return MockData.invalidResponse
        case .emptyCategoryResponse:
            return MockData.emptyCateogryResponse
        default:
            return ""
        }
    }
}

//2
class  MockNetworkManager: PostNetworkDataManaging {
    let responseType: ResponseType
    
    init(with responseType: ResponseType) {
        self.responseType = responseType
    }
    
    func getPostItemsFrom(url: URL, completion: @escaping (Result<PostItems, NetworkError>) -> ()) {
        let responseStr = self.responseType.getResponse()
        guard let data = responseStr.data(using: .utf8, allowLossyConversion: false) else {
            completion(.failure(.dataError))
            return
        }
        do {
            let result = try JSONDecoder().decode(PostItems.self, from: data)
            completion(.success(result))
        } catch {
            completion(.failure(.parseError))
        }
        
    }
}

//3
struct MockData {
   static let validResponse = """
{
    "items": [{
            "title": "Sunday Funday",
            "description": "Zombie ipsum reversus ab viral inferno, nam rick grimes malum cerebro. De carne lumbering animata corpora quaeritis. Summus brains sit​​, morbo vel maleficia? De apocalypsi gorger omero undead survivor dictum mauris. Hi mindless mortuis soulless creaturas, imo evil stalking monstra adventus resi dentevil vultus comedat cerebella viventium",
            "postId": 0,
            "category": ["Zombie"]
        },
        {
            "title": "Bowman House & Museum Special Event",
            "description": "A museum is an institution that cares for a collection of artifacts and other objects of artistic, cultural, historical, or scientific importance. Many public museums make these items available for public viewing through exhibits that may be permanent or temporary",
            "postId": 1,
            "category": ["Building", "House", "Museum"]
        },
        {
            "title": "Little Art Room",
            "description": "Good art is about balance, composition, use of light, how the artist moves the viewer's eye throughout the piece, it's about the message, or what the artist is trying to communicate, to convey. It is about how the artist used his medium, his skills.",
            "postId": 2,
            "category": ["Room", "House"]
        },
        {
            "title": "Fall Movie Nights",
            "description": "provides linguistic descriptions of movies and allows visually impaired people to follow a movie along with their peers. Such descriptions are by design mainly visual and thus naturally form an interesting data source for computer vision and computational linguistics.",
            "postId": 2,
            "category": ["Movies"]
        }
    ]
}
"""
  static  let emptyResponse = """
{
    "items": [
    ]
}
"""
  static  let invalidResponse = """
{
    
}
"""
  static  let emptyCateogryResponse = """
{
"items": [{
        "title": "Sunday Funday",
        "description": "Zombie ipsum reversus ab viral inferno, nam rick grimes malum cerebro. De carne lumbering animata corpora quaeritis. Summus brains sit​​, morbo vel maleficia? De apocalypsi gorger omero undead survivor dictum mauris. Hi mindless mortuis soulless creaturas, imo evil stalking monstra adventus resi dentevil vultus comedat cerebella viventium",
        "postId": 0,
        "category": []
    }]
}
"""
    //goes all the response types that you may wist to add
}
