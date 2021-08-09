//
//  Article.swift
//  Study_SwiftMVVM
//
//  Created by DaunJoung on 2021/08/08.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article:Decodable {
    let title: String?
    let description: String?
}
