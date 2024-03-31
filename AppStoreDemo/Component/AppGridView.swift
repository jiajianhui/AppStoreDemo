//
//  AppGridView.swift
//  AppStoreDemo
//
//  Created by 贾建辉 on 2024/3/30.
//

import SwiftUI

struct AppGridView: View {
    
    var appGridModel: AppGridModel
    
    //定义Grid布局
    let rows: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(spacing: 6) {
            //标题
            TitleView(title: appGridModel.title, subTitle: appGridModel.subTitle, showSubTitle: appGridModel.showSubTitle)
            
            //列表
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows,alignment: .center, spacing: 10, content: {
                    
                    ForEach(appGridModel.appIntros) { appIntro in
                        AppIntro(appIntroModel: appIntro)
                    }
                    
                })
                .scrollTargetLayout()
                .frame(maxHeight: 220)
            }
            .safeAreaPadding(.horizontal, 20)
            .scrollTargetBehavior(.paging)
        }
        .padding(.top, 30)
    }
}

#Preview {
    AppGridView(appGridModel: 
                    AppGridModel(title: "30 款近期佳作", subTitle: "向左滑动 查看更多", showSubTitle: true, appIntros: [
                        AppIntroModel(appCover: "chatgpt", appName: "chatGpt", appDescription: "openAI,L.L.C"),
                        AppIntroModel(appCover: "email", appName: "Email", appDescription: "Apple"),
                        AppIntroModel(appCover: "podcast", appName: "Apple Podcast", appDescription: "Apple"),
                        AppIntroModel(appCover: "qq", appName: "QQ", appDescription: "QQ9全新上线，一起轻松做自己"),
                        AppIntroModel(appCover: "tiktok", appName: "抖音", appDescription: "记录美好生活"),
                        AppIntroModel(appCover: "music", appName: "Apple Music", appDescription: "Apple"),
                        AppIntroModel(appCover: "tv", appName: "视频", appDescription: "App TV+等内容的大本营"),
                        AppIntroModel(appCover: "wechat", appName: "微信", appDescription: "社交"),
                    ])
    )
}



