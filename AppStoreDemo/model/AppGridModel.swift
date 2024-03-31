//
//  AppGridModel.swift
//  AppStoreDemo
//
//  Created by 贾建辉 on 2024/3/31.
//

import Foundation


//模型
struct AppIntroModel: Identifiable {
    var id = UUID()
    
    let appCover: String
    let appName: String
    let appDescription: String
    
    //是否为小卡片
    var isSmall: Bool = false
    
}


struct AppGridModel: Identifiable {
    var id = UUID()
    
    let title: String
    let subTitle: String
    var showSubTitle: Bool
    var showBtn: Bool = true
    
    let appIntros: [AppIntroModel]
    
    
}




//模拟数据
var appGrids: [AppGridModel] = [
    AppGridModel(title: "30 款近期佳作", subTitle: "向左滑动 查看更多", showSubTitle: true, appIntros: [
        AppIntroModel(appCover: "chatgpt", appName: "chatGpt", appDescription: "openAI,L.L.C"),
        AppIntroModel(appCover: "email", appName: "Email", appDescription: "Apple"),
        AppIntroModel(appCover: "podcast", appName: "Apple Podcast", appDescription: "Apple"),
        AppIntroModel(appCover: "qq", appName: "QQ", appDescription: "QQ9全新上线，一起轻松做自己"),
        AppIntroModel(appCover: "tiktok", appName: "抖音", appDescription: "记录美好生活"),
        AppIntroModel(appCover: "music", appName: "Apple Music", appDescription: "Apple"),
        AppIntroModel(appCover: "tv", appName: "视频", appDescription: "App TV+等内容的大本营"),
        AppIntroModel(appCover: "wechat", appName: "微信", appDescription: "社交"),
    ]),
    AppGridModel(title: "300 款近期佳作", subTitle: "向左滑动 查看更多", showSubTitle: true, appIntros: [
        AppIntroModel(appCover: "chatgpt", appName: "chatGpt", appDescription: "openAI,L.L.C"),
        AppIntroModel(appCover: "email", appName: "Email", appDescription: "Apple"),
        AppIntroModel(appCover: "podcast", appName: "Apple Podcast", appDescription: "Apple"),
        AppIntroModel(appCover: "qq", appName: "QQ", appDescription: "QQ9全新上线，一起轻松做自己"),
        AppIntroModel(appCover: "tiktok", appName: "抖音", appDescription: "记录美好生活"),
        AppIntroModel(appCover: "music", appName: "Apple Music", appDescription: "Apple"),
        AppIntroModel(appCover: "tv", appName: "视频", appDescription: "App TV+等内容的大本营"),
        AppIntroModel(appCover: "wechat", appName: "微信", appDescription: "社交"),
    ])
]

