//
//  AppInfo.swift
//  AppStoreDemo
//
//  Created by 贾建辉 on 2024/3/29.
//

import SwiftUI

struct AppInfo: View {
    var body: some View {
        HStack {
            cover
            title
            Spacer()
            getBtn
        }
        .frame(width: UIScreen.main.bounds.width - 40)
    }
}

#Preview {
    AppInfo()
}

extension AppInfo {
    
    var cover: some View {
        Image("01")
            .resizable()
            .scaledToFill()
            .frame(width: 70, height: 70)
            .mask(RoundedRectangle(cornerRadius: 12, style: .continuous))
    }
    
    var title: some View {
        VStack(alignment: .leading) {
            Text("标题")
            Text("描述")
                .font(.caption)
                .foregroundStyle(Color.gray)
        }
    }
    
    var getBtn: some View {
        Button {
            
        } label: {
            Text("获取")
                .font(.callout)
                .fontWeight(.medium)
                .padding(6)
                .padding(.horizontal, 12)
                .background {
                    RoundedRectangle(cornerRadius: 90)
                        .foregroundStyle(Color(uiColor: .systemGray6))
                }
        }
    }
    
}
