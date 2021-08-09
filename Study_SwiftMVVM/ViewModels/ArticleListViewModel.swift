//
//  ArticleListViewModel.swift
//  Study_SwiftMVVM
//
//  Created by DaunJoung on 2021/08/08.
//

import Foundation
import RxSwift

struct ArticleListViewModel {
//    let articles: [Article]
    var articles = PublishSubject<Article?>()
}

extension ArticleListViewModel {
//    var numberOfSections: Int {
//        return 1
//    }
//
//    func numberOfRowsInSection(_ section: Int) -> Int {
//        return self.articles.count
//    }
//
//    func articleAtIndex(_ index:Int) -> ArticleViewModel {
//        let article = self.articles[index]
//        return ArticleViewModel(article)
//    }
}

//struct ArticleViewModel {
//    private let article: Article
//}
//
//
//extension ArticleViewModel {
//    init(_ article: Article) {
//        self.article = article
//    }
//}
//
//extension ArticleViewModel {
//    var title: String? {
//        return self.article.title
//    }
//    var description: String? {
//        return self.article.description
//    }
//}
