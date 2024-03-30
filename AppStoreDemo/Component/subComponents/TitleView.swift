//
//  TitleView.swift
//  AppStoreDemo
//
//  Created by 贾建辉 on 2024/3/29.
//

import SwiftUI

struct TitleView: View {
    
    var title: String
    var subTitle: String
    
    var showSubTitle: Bool
    var showBtn: Bool = true
    
    
    var body: some View {
        VStack {
            Divider()
            HStack {
                VStack(alignment: .leading, spacing:2) {
                    Text(title)
                        .font(.title2)
                        .fontWeight(.bold)
                    if showSubTitle {
                        Text(subTitle)
                            .font(.system(size: 15))
                            .foregroundStyle(Color(uiColor: .systemGray2))
                    }
                }
                Spacer()
                if showBtn {
                    Button {
                        
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
    TitleView(title: "30 款近期佳作", subTitle: "向左滑动 查看更多", showSubTitle: true)
}
