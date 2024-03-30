//
//  AppGridView.swift
//  AppStoreDemo
//
//  Created by 贾建辉 on 2024/3/30.
//

import SwiftUI

struct AppGridView: View {
    
    var title: String
    var subTitle: String
    
    var showSubTitle: Bool
    var showBtn: Bool = true
    
    //定义Grid布局
    let rows: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(spacing: 6) {
            //标题
            TitleView(title: title, subTitle: subTitle, showSubTitle: showSubTitle)
            
            //列表
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows,alignment: .center, spacing: 10, content: {
                    
                    ForEach(0..<7) { _ in
                        AppInfo()
                    }
                    
                })
                .scrollTargetLayout()
                .frame(maxHeight: 260)
            }
            .safeAreaPadding(.horizontal, 20)
            .scrollTargetBehavior(.paging)
        }
        .padding(.top, 30)
    }
}

#Preview {
    AppGridView(title: "30 款近期佳作", subTitle: "向左滑动 查看更多", showSubTitle: true)
}



