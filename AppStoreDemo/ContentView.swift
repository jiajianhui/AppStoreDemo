//
//  ContentView.swift
//  AppStoreDemo
//
//  Created by 贾建辉 on 2024/3/25.
//

import SwiftUI

struct ContentView: View {
    
    //是否展示详情
    @State var showDetail: Bool = false
    
    //当前选择的card
    @State var selectedID = UUID()
    
    @Namespace var nameSpace
    
    var body: some View {
        ZStack {  //使用ZStack方便让变换效果更加顺畅
            TabView {
                TodayView(showDetail: $showDetail, selectedID: $selectedID, nameSpace: nameSpace)
                    .tabItem {
                        Image(systemName: "doc.text.image")
                        Text("Today")
                    }
                GameView()
                    .tabItem {
                        Image(systemName: "gamecontroller")
                        Text("游戏")
                    }
                AppView()
                    .tabItem {
                        Image(systemName: "square.stack.3d.up.fill")
                        Text("App")
                    }
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("搜索")
                    }
            }
            .zIndex(1)
            
            //避免tabbar 图标闪烁；如果不用它，Sheet页面必须使用toolbar关闭，下拉关闭也会闪烁
            .accentColor(.blue)
            
            //详情页
            if showDetail {
//                ForEach(cards) { card in
//                    if card.id == selectedID {
//                        CardDetailView(cardContent: card)
//                    }
//                }
                if let card = cards.first(where: { $0.id == selectedID }) {
                    ZStack {
                        CardDetailView(cardContent: card, showDetail: $showDetail, selectedID: $selectedID, nameSpace: nameSpace)
                    }
                    .zIndex(20) //让动画过度效果置于顶层
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
