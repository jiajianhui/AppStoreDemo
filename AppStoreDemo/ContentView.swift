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
                Text("2")
                    .tabItem {
                        Image(systemName: "gamecontroller")
                        Text("游戏")
                    }
                Text("3")
                    .tabItem {
                        Image(systemName: "square.stack.3d.up.fill")
                        Text("App")
                    }
                Text("4")
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("搜索")
                    }
            }
            .zIndex(1)
            
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
