//
//  AppView.swift
//  AppStoreDemo
//
//  Created by 贾建辉 on 2024/3/26.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 4) {
                    HeaderView(title: "App", showDate: false)
                    
                    //入口标签
                    TagView(isGame: false)
                    
                    //推荐卡片
                    EventView(isGame: false)
                    
                    //推荐列表
                    RankView(isGame: false)
                    
                }
                
            }
        }
    }
}

#Preview {
    AppView()
}
