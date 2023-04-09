//
//  Post.swift
//  NetworkApp
//
//  Created by Nigar on 01.04.23.
//

import Foundation

struct Post: Codable {
    let userId: Int?
    let id: Int?
    let title: String?
    let body: String?
}
