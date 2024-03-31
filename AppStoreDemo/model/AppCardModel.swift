//
//  AppCardModel.swift
//  AppStoreDemo
//
//  Created by 贾建辉 on 2024/3/31.
//

import Foundation


//模型
struct AppCardModel: Identifiable {
    var id = UUID()
    
    let title: String
    let subTitle: String
    let tagName: String
    
    let bigCover: String
    
    let appIntro: AppIntroModel
}


//游戏数据
var gameCrads: [AppCardModel] = [
    AppCardModel(title: "ChatGPT", subTitle: "与AI自由对话", tagName: "主打推荐", bigCover: "card01", appIntro: AppIntroModel(appCover: "chatgpt", appName: "ChatGPT", appDescription: "openAI,L.L.C", isSmall: true)),
    AppCardModel(title: "QQ", subTitle: "QQ9全新上线，一起轻松做自己", tagName: "热门推荐", bigCover: "card02", appIntro: AppIntroModel(appCover: "qq", appName: "QQ", appDescription: "QQ9全新上线，一起轻松做自己", isSmall: true)),
    AppCardModel(title: "Apple Music", subTitle: "让音乐伴你左右", tagName: "进行中", bigCover: "card03", appIntro: AppIntroModel(appCover: "music", appName: "Apple Music", appDescription: "音乐声声不息", isSmall: true))
]



//应用数据
//var appCrads: [AppCardModel] = [
//    AppCardModel(title: "", subTitle: "", tagName: "", bigCover: "", appIntros: [
//        AppIntroModel(appCover: "", appName: "", appDescription: "", isSmall: true)
//    ])
//]
