//
//  AppGridView.swift
//  AppStoreDemo
//
//  Created by 贾建辉 on 2024/3/30.
//

import SwiftUI

struct RankView: View {
    
    //定义Grid布局
    let rows: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var isGame: Bool
    
    var body: some View {
        
        VStack(spacing: 0) {
            ForEach(isGame ? gameRank : appRank) { rank in
                VStack(spacing: 6) {
                    //标题
                    TitleView(rankModel: rank)
                    
                    //列表
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: rows,alignment: .center, spacing: 10, content: {
                            
                            ForEach(rank.appIntros) { appIntro in
                                AppIntro(appIntroModel: appIntro)
                                    .frame(width: UIScreen.main.bounds.width - 40)
                            }
                            
                        })
                        .scrollTargetLayout()
                        .frame(height: 220)
                    }
                    .safeAreaPadding(.horizontal, 20)
                    .scrollTargetBehavior(.viewAligned)  //iOS17的新功能；viewAligned——滚动时对齐视图
                }
                .padding(.top, 30)
            }
        }
        
        
    }
}

#Preview {
    RankView(isGame: true)
}



