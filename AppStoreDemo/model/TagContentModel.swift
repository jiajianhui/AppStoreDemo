//
//  TagContentModel.swift
//  AppStoreDemo
//
//  Created by 贾建辉 on 2024/3/29.
//

import Foundation

struct TagContentModel: Identifiable {
    let id = UUID()
    let image: String
    let name: String
}


//数据
var gameTags: [TagContentModel] = [
    TagContentModel(image: "角色扮演", name: "角色扮演"),
    TagContentModel(image: "竞速", name: "竞速"),
    TagContentModel(image: "卡牌", name: "卡牌"),
    TagContentModel(image: "模拟", name: "模拟"),
    TagContentModel(image: "休闲", name: "休闲"),
    TagContentModel(image: "字谜", name: "字谜")
]


var appTags: [TagContentModel] = [
    TagContentModel(image: "1", name: "模拟"),
    TagContentModel(image: "2", name: "角色扮演"),
    TagContentModel(image: "2", name: "角色扮演"),
    TagContentModel(image: "2", name: "角色扮演"),
    TagContentModel(image: "2", name: "角色扮演"),
    TagContentModel(image: "2", name: "角色扮演"),
    TagContentModel(image: "2", name: "角色扮演")
]
