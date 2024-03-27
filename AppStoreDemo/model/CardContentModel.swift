//
//  CardContentModel.swift
//  AppStoreDemo
//
//  Created by 贾建辉 on 2024/3/24.
//

import Foundation

//模型
struct CardContentModel: Identifiable {
    let id = UUID()
    let cover: String
    let title: String
    let description: String
    
}

//数据
var cards: [CardContentModel] = [
    CardContentModel(cover: "01", title: "1", description: "1"),
    CardContentModel(cover: "02", title: "2", description: "2"),
    CardContentModel(cover: "03", title: "3", description: "3")
]

