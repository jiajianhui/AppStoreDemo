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


struct EventModel: Identifiable {
    var id = UUID()
    
    let title: String
    let subTitle: String
    var showSubTitle: Bool
    var showBtn: Bool = true
    
    let appIntros: [AppIntroModel]
    
    
}




//游戏数据
var gameGrids: [EventModel] = [
    EventModel(title: "30 款近期佳作", subTitle: "向左滑动 查看更多", showSubTitle: true, appIntros: [
        AppIntroModel(appCover: "game01", appName: "王者荣耀", appDescription: "S35赛季 命归缘起"),
        AppIntroModel(appCover: "game02", appName: "地铁跑酷 - 官方中文版", appDescription: "跑酷爆改课间操，雏鹰起飞"),
        AppIntroModel(appCover: "game03", appName: "崩坏：星穹铁道", appDescription: "米哈游银河冒险策略游戏"),
        AppIntroModel(appCover: "game04", appName: "金铲铲之战", appDescription: "英雄联盟云顶之弈正版授权手游"),
        AppIntroModel(appCover: "game05", appName: "梦幻西游", appDescription: "网易出品，招牌回合制手游"),
        AppIntroModel(appCover: "game06", appName: "逆水寒", appDescription: "武侠开放世界，会呼吸的江湖"),
        AppIntroModel(appCover: "game07", appName: "英雄联盟手游", appDescription: "龙年新春特别版本 S12赛季开启"),
        AppIntroModel(appCover: "game08", appName: "三国志·战略版", appDescription: "光荣正版 真实水陆战争策略大作"),
    ]),
    EventModel(title: "必玩游戏精选", subTitle: "向左滑动 查看更多", showSubTitle: false, appIntros: [
        AppIntroModel(appCover: "game01", appName: "王者荣耀", appDescription: "S35赛季 命归缘起"),
        AppIntroModel(appCover: "game02", appName: "地铁跑酷 - 官方中文版", appDescription: "跑酷爆改课间操，雏鹰起飞"),
        AppIntroModel(appCover: "game03", appName: "崩坏：星穹铁道", appDescription: "米哈游银河冒险策略游戏"),
        AppIntroModel(appCover: "game04", appName: "金铲铲之战", appDescription: "英雄联盟云顶之弈正版授权手游"),
        AppIntroModel(appCover: "game05", appName: "梦幻西游", appDescription: "网易出品，招牌回合制手游"),
        AppIntroModel(appCover: "game06", appName: "逆水寒", appDescription: "武侠开放世界，会呼吸的江湖"),
        AppIntroModel(appCover: "game07", appName: "英雄联盟手游", appDescription: "龙年新春特别版本 S12赛季开启"),
        AppIntroModel(appCover: "game08", appName: "三国志·战略版", appDescription: "光荣正版 真实水陆战争策略大作"),
    ]),
]


//应用数据
var appGrids: [EventModel] = [
    EventModel(title: "30 款大家都在用", subTitle: "向左滑动 查看更多", showSubTitle: true, appIntros: [
        AppIntroModel(appCover: "chatgpt", appName: "chatGpt", appDescription: "openAI,L.L.C"),
        AppIntroModel(appCover: "email", appName: "Email", appDescription: "Apple"),
        AppIntroModel(appCover: "podcast", appName: "Apple Podcast", appDescription: "Apple"),
        AppIntroModel(appCover: "qq", appName: "QQ", appDescription: "QQ9全新上线，一起轻松做自己"),
        AppIntroModel(appCover: "tiktok", appName: "抖音", appDescription: "记录美好生活"),
        AppIntroModel(appCover: "music", appName: "Apple Music", appDescription: "Apple"),
        AppIntroModel(appCover: "tv", appName: "视频", appDescription: "App TV+等内容的大本营"),
        AppIntroModel(appCover: "wechat", appName: "微信", appDescription: "社交"),
    ]),
    EventModel(title: "热门App", subTitle: "向左滑动 查看更多", showSubTitle: false, appIntros: [
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
