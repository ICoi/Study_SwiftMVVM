//
//  TableViewController.swift
//  Study_SwiftMVVM
//
//  Created by DaunJoung on 2021/08/08.
//

import UIKit
import RxSwift
import RxCocoa

class NewsListTableViewController:UIViewController {
    
    private var articleListVM: ArticleListViewModel!
    @IBOutlet weak var tableView: UITableView!
    let viewModel = MemberViewModel.shared
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        bindTableView()
    }
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
//        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=e9b514c39c5f456db8ed4ecb693b0040")!
//        WebService().getArticles(url: url) {  // 1
//            (articles) in
//            if let articles = articles {
//                self.articleListVM = ArticleListViewModel(articles: articles)  // 2
//            }
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
    }
    
    private func bindTableView() {
        let cities = ["London", "Vienna", "Lisbon"]

        let citiesOb: Observable<[String]> = Observable.of(cities)
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=e9b514c39c5f456db8ed4ecb693b0040")!
        
//        WebService().getArticles(url: url)
//            .observe(on: MainScheduler.instance)

        viewModel.members
            .observe(on: MainScheduler.instance)
            .filter{ !$0.isEmpty}
            .bind(to: tableView.rx.items) { (tableView: UITableView, index: Int, element: Member) -> UITableViewCell in

            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)

                cell.textLabel?.text = element.name

            return cell

        }.disposed(by: bag)
        
    }
}

//extension NewsListTableViewController:  UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.articleListVM.numberOfRowsInSection(section)
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
//    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
//
//        let articleVM = self.articleListVM.articleAtIndex(indexPath.row) //3
//        cell.textLabel?.text = articleVM.title
//        cell.detailTextLabel?.text = articleVM.description
//        return cell
//    }
//}
