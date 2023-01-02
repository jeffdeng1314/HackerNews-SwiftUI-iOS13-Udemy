//
//  PostData.swift
//  Hacker News
//
//  Created by Jeff Deng on 12/30/22.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    // computed properties, we needed 'id' for Identifiable protocol
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
