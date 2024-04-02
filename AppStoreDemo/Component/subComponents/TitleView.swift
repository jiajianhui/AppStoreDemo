//
//  TitleView.swift
//  AppStoreDemo
//
//  Created by 贾建辉 on 2024/3/29.
//

import SwiftUI

struct TitleView: View {
    
    var rankModel: RankModel
    
    
    var body: some View {
        VStack {
            Divider()
            HStack {
                VStack(alignment: .leading, spacing:2) {
                    Text(rankModel.title)
                        .font(.title2)
                        .fontWeight(.bold)
                    if rankModel.showSubTitle {
                        Text(rankModel.subTitle)
                            .font(.system(size: 15))
                            .foregroundStyle(Color(uiColor: .systemGray2))
                    }
                }
                Spacer()
                if rankModel.showBtn {
                    NavigationLink {
                        SeeMoreView(rankModel: rankModel)
                    } label: {
                        Text("查看全部")
                    }
                }
            }
            .padding(.vertical, 4)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    TitleView(rankModel: 
              RankModel(title: "30 款近期佳作", subTitle: "向左滑动 查看更多", showSubTitle: true, appIntros: [
                  AppIntroModel(appCover: "game01", appName: "王者荣耀", appDescription: "S35赛季 命归缘起"),
                  AppIntroModel(appCover: "game02", appName: "地铁跑酷 - 官方中文版", appDescription: "跑酷爆改课间操，雏鹰起飞"),
                  AppIntroModel(appCover: "game03", appName: "崩坏：星穹铁道", appDescription: "米哈游银河冒险策略游戏"),
                  AppIntroModel(appCover: "game04", appName: "金铲铲之战", appDescription: "英雄联盟云顶之弈正版授权手游"),
                  AppIntroModel(appCover: "game05", appName: "梦幻西游", appDescription: "网易出品，招牌回合制手游"),
                  AppIntroModel(appCover: "game06", appName: "逆水寒", appDescription: "武侠开放世界，会呼吸的江湖"),
                  AppIntroModel(appCover: "game07", appName: "英雄联盟手游", appDescription: "龙年新春特别版本 S12赛季开启"),
                  AppIntroModel(appCover: "game08", appName: "三国志·战略版", appDescription: "光荣正版 真实水陆战争策略大作"),
              ])
    )
}
