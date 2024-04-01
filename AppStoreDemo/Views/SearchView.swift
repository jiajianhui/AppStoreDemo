//
//  SearchView.swift
//  AppStoreDemo
//
//  Created by 贾建辉 on 2024/3/26.
//

import SwiftUI

struct SearchView: View {
    @State var searchText: String = ""
    @State var showBlurBG: Bool = false
    
    var body: some View {
        ScrollView {
            
            VStack(spacing: 4) {
                HeaderView(title: "搜索", showDate: false, showBlurBG: $showBlurBG)
                //入口标签
                TagView(isGame: false)
                
                //推荐卡片
                EventView(isGame: true)
                
                //推荐列表
                RankView(isGame: true)
            }
            
            
        }
        .overlay(alignment: .top) {
            BlurBGView(showBlurBG: $showBlurBG, title: "搜索")
        }
    }
}

#Preview {
    SearchView()
}
