//
//  WebService.swift
//  Study_SwiftMVVM
//
//  Created by DaunJoung on 2021/08/08.
//

import Foundation
import RxSwift


class WebService {
    func getArticles(url:URL) -> Observable<Article?> {
        return Observable.create() { emitter in
            let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
                guard error == nil else {
                    emitter.onError(error!)       // 에러 처리
                    return
                }
                
                if let data = data {
                    if let articleList = try? JSONDecoder().decode(ArticleList.self, from: data) {
                        for article in articleList.articles {
                            emitter.onNext(article)
                        }
                        emitter.onCompleted()
                    }
                }
            }
            task.resume()
            
            return Disposables.create() {
                // dispose 실행되었을 때
                task.cancel()
            }
        }
    }
    
    
//    func getArticles(url:URL, completion:@escaping([Article]?)->()) {
//        URLSession.shared.dataTask(with: url) {
//            (data, response, error) in
//            if let error = error {
//                print(error.localizedDescription)
//                completion(nil) // if any error occurs, article can be nil
//            }
//            else if let data = data {
//                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
//                print(articleList)
//                if let articleList = articleList {
//                    completion(articleList.articles)
//                }
//                print(articleList?.articles)
//            }
//        }.resume()
//    }
}
