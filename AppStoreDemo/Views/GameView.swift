//
//  GameView.swift
//  AppStoreDemo
//
//  Created by 贾建辉 on 2024/3/26.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 4) {
                    HeaderView(title: "游戏", showDate: false)
                    
                    //入口标签
                    AppTagView()
                    
                    //推荐卡片
                    AppCardView()
                    
                    //推荐列表
                    AppGridView(title: "30 款近期佳作", subTitle: "向左滑动 查看更多", showSubTitle: true)
                    AppGridView(title: "30 款近期佳作", subTitle: "向左滑动 查看更多", showSubTitle: false)
                    
                }
                
            }
        }

    }
}

#Preview {
    GameView()
}
