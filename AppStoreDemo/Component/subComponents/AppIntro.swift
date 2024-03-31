//
//  AppInfo.swift
//  AppStoreDemo
//
//  Created by 贾建辉 on 2024/3/29.
//

import SwiftUI

struct AppIntro: View {
    
    var appIntroModel: AppIntroModel
    
    var body: some View {
        HStack {
            appCover
            title
            Spacer()
            getBtn
        }
        .frame(width: UIScreen.main.bounds.width - 40)
    }
}

#Preview {
    AppIntro(appIntroModel: AppIntroModel(appCover: "chatgpt", appName: "chatGpt", appDescription: "openAI,L.L.C"))
}

extension AppIntro {
    
    var appCover: some View {
        Image(appIntroModel.appCover)
            .resizable()
            .scaledToFill()
            .frame(width: 60, height: 60)
            .mask(RoundedRectangle(cornerRadius: 14, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .fill(Color.clear)
                    .stroke(Color.black.opacity(0.1), lineWidth: 1)
            }
            
    }
    
    var title: some View {
        VStack(alignment: .leading) {
            Text(appIntroModel.appName)
            Text(appIntroModel.appDescription)
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
