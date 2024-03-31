//
//  AppInfo.swift
//  AppStoreDemo
//
//  Created by 贾建辉 on 2024/3/29.
//

import SwiftUI

struct AppIntro: View {
    
    var appIntroModel: AppIntroModel
    
    var width: CGFloat = 60
    
    
    var body: some View {
        HStack {
            appCover
            title
            Spacer()
            getBtn
        }
    }
}

#Preview {
    VStack {
        AppIntro(appIntroModel: AppIntroModel(appCover: "chatgpt", appName: "ChatGPT", appDescription: "OpenAI,L.L.C"))
        AppIntro(appIntroModel: AppIntroModel(appCover: "chatgpt", appName: "ChatGPT", appDescription: "OpenAI,L.L.C", isSmall: true))
            .padding()
            .background {
                Color.green
            }
    }
    
    
}

extension AppIntro {
    
    var appCover: some View {
        Image(appIntroModel.appCover)
            .resizable()
            .scaledToFill()
            .frame(
                width: appIntroModel.isSmall ? 40 : 60,
                height: appIntroModel.isSmall ? 40 : 60
            )
            .mask(RoundedRectangle(cornerRadius: appIntroModel.isSmall ? 8 : 14, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: appIntroModel.isSmall ? 8 : 14, style: .continuous)
                    .fill(Color.clear)
                    .stroke(Color.black.opacity(0.1), lineWidth: 1)
            }
            
    }
    
    var title: some View {
        VStack(alignment: .leading) {
            Text(appIntroModel.appName)
                .foregroundStyle(appIntroModel.isSmall ? Color.white : Color.primary)
                .fontWeight(.medium)
            Text(appIntroModel.appDescription)
                .font(.caption)
                .foregroundStyle(appIntroModel.isSmall ? Color.white.opacity(0.6) : Color.gray)
        }
    }
    
    var getBtn: some View {
        Button {
            
        } label: {
            Text("获取")
                .font(.callout)
                .foregroundStyle(appIntroModel.isSmall ? Color.white : Color.blue)
                .fontWeight(.medium)
                .padding(6)
                .padding(.horizontal, 12)
                .background {
                    RoundedRectangle(cornerRadius: 90)
                        .foregroundStyle(appIntroModel.isSmall ? Color.white.opacity(0.4) : Color(uiColor: .systemGray6))
                }
        }
    }
    
}
