//
//  AppCardView.swift
//  AppStoreDemo
//
//  Created by 贾建辉 on 2024/3/30.
//

import SwiftUI

struct EventView: View {
    
    var isGame: Bool
    
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(isGame ? gameCrads : appCrads) { card in
                    NavigationLink {
                        AppDetailView(appIntroModel: card.appIntro)
                    } label: {
                        VStack(alignment: .leading, spacing: 10) {
                            
                            //标题
                            VStack(alignment: .leading, spacing: 0) {
                                Text(card.tagName)
                                    .font(.caption)
                                    .fontWeight(.medium)
                                    .foregroundStyle(.blue)
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(card.title)
                                        .font(.title2)
                                    Text(card.subTitle)
                                        .font(.title3)
                                        .foregroundStyle(Color(uiColor: .systemGray2))
                                }
                            }
                            
                            //图片
                            Image(card.bigCover)
                                .resizable()
                                .scaledToFill()
                                .frame(
                                    width: UIScreen.main.bounds.width - 40,
                                    height: (UIScreen.main.bounds.width - 40) / 4 * 2.5
                                )
                                
                                //描边
                                .overlay {
                                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                                        .stroke(Color.black.opacity(0.1), lineWidth: 1)
                                }
                                
                                .overlay(alignment: .bottom) {
                                    AppIntro(appIntroModel: card.appIntro, sizeType: .small)
                                        .padding()
                                        .frame(height: 60)
                                        
                                        //模糊背景
                                        .background {
                                            ZStack {
                                                Image(card.bigCover)
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(height: 60)
                                                    .blur(radius: 30)
                                                    .mask(
                                                        Rectangle()
                                                            //让图片有一个透明过渡效果
                                                            .fill(LinearGradient(colors: [.black, .white.opacity(0)], startPoint: UnitPoint(x: 0, y: 0.5), endPoint: UnitPoint(x: 0, y: 0)))
                                                            .frame(height: 60)
                                                    )
                                                //UnitPoint自定义起始点，0.5表示从中心点开始
                                                LinearGradient(colors: [.black.opacity(0.3), .black.opacity(0)], startPoint: UnitPoint(x: 0, y: 0.8), endPoint: UnitPoint(x: 0, y: 0))
                                            }
                                            
                                        }
                                }
                                .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
                                
                        }
                        .padding(.bottom, 2)
                    }

                    
                }
            }
            .scrollTargetLayout()
        }
        .safeAreaPadding(.horizontal, 20)
        .scrollTargetBehavior(.viewAligned)  //iOS17的新功能；viewAligned——滚动时对齐视图
    }
}

#Preview {
    EventView(isGame: true)
}
