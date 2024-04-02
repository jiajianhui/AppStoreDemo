//
//  AppCardModel.swift
//  AppStoreDemo
//
//  Created by 贾建辉 on 2024/3/31.
//

import Foundation


//模型
struct EventModel: Identifiable {
    var id = UUID()
    
    let title: String
    let subTitle: String
    let tagName: String
    
    let bigCover: String
    
    let appIntro: AppIntroModel
}


//游戏数据
var gameCrads: [EventModel] = [
    EventModel(title: "王者荣耀", subTitle: "S35赛季 命归缘起", tagName: "主打推荐", bigCover: "gamecard01", appIntro: AppIntroModel(appCover: "game01", appName: "王者荣耀 - 新赛季，起航", appDescription: "S35赛季 命归缘起")),
    EventModel(title: "地铁跑酷", subTitle: "临安阁楼一杯酒 江湖夜雨十年灯", tagName: "新游狂欢", bigCover: "gamecard02", appIntro: AppIntroModel(appCover: "game02", appName: "地铁跑酷 - 官方中文版", appDescription: "跑酷爆改课间操，雏鹰起飞")),
    EventModel(title: "仙境传说", subTitle: "重温经典冒险 遇见感动与爱", tagName: "进行中", bigCover: "gamecard03", appIntro: AppIntroModel(appCover: "game03", appName: "仙境传说：爱如初见", appDescription: "重温经典冒险"))
]



//应用数据
var appCrads: [EventModel] = [
    EventModel(title: "ChatGPT", subTitle: "与AI自由对话", tagName: "主打推荐", bigCover: "appcard01", appIntro: AppIntroModel(appCover: "chatgpt", appName: "ChatGPT", appDescription: "openAI,L.L.C")),
    EventModel(title: "QQ", subTitle: "QQ9全新上线，一起轻松做自己", tagName: "热门推荐", bigCover: "appcard02", appIntro: AppIntroModel(appCover: "qq", appName: "QQ", appDescription: "QQ9全新上线，一起轻松做自己")),
    EventModel(title: "Apple Music", subTitle: "让音乐伴你左右", tagName: "进行中", bigCover: "appcard03", appIntro: AppIntroModel(appCover: "music", appName: "Apple Music", appDescription: "音乐声声不息"))
]
