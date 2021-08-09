//
//  MemberViewModel.swift
//  Study_SwiftMVVM
//
//  Created by DaunJoung on 2021/08/09.
//

import Foundation
import RxSwift

class MemberViewModel {
    static let shared = MemberViewModel()
    
    var members = BehaviorSubject<[Member]>(value: [])
    
    var selectedMember = Member.EMPTY
    
    init() {
        reloadData()
    }
    
    func reloadData() {
        // Observable<Data> --> subscribe --> members
        _ = APIManager.fetchData(url: APIManager.MEMBER_LIST_URL)
            .map{ data -> [Member] in
                let members = try! JSONDecoder().decode([Member].self, from: data)
                return members
            }
            .take(1)
            .subscribe(onNext: { self.members.onNext($0)})
    }
}
