//
//  TagContentModel.swift
//  AppStoreDemo
//
//  Created by 贾建辉 on 2024/3/29.
//

import Foundation

struct TagModel: Identifiable {
    let id = UUID()
    let image: String
    let name: String
}


//数据
var gameTags: [TagModel] = [
    TagModel(image: "角色扮演", name: "角色扮演"),
    TagModel(image: "竞速", name: "竞速"),
    TagModel(image: "卡牌", name: "卡牌"),
    TagModel(image: "模拟", name: "模拟"),
    TagModel(image: "休闲", name: "休闲"),
    TagModel(image: "字谜", name: "字谜")
]


var appTags: [TagModel] = [
    TagModel(image: "工具", name: "工具"),
    TagModel(image: "健康", name: "健康"),
    TagModel(image: "社交", name: "社交"),
    TagModel(image: "摄影与录像", name: "摄影与录像"),
    TagModel(image: "效率", name: "效率"),
    TagModel(image: "娱乐", name: "娱乐")
]
