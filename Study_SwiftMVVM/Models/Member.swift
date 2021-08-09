//
//  Member.swift
//  Study_SwiftMVVM
//
//  Created by DaunJoung on 2021/08/09.
//

import Foundation


struct Member: Codable {
    let id : Int
    let name : String
    let avatar : String
    let job : String
    let age : Int
}

extension Member {
    static let EMPTY = Member(id: 0, name: "name", avatar: "", job: "job", age: 0)
}
