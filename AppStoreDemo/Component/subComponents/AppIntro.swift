//
//  AppInfo.swift
//  AppStoreDemo
//
//  Created by 贾建辉 on 2024/3/29.
//

import SwiftUI

enum SizeType {
    case normal, small, big
}

struct AppIntro: View {
    
    var appIntroModel: AppIntroModel
    
    var normalSize: CGFloat = 60
    var smallSize: CGFloat = 40
    var bigSize: CGFloat = 90
    
    var normalRadius: CGFloat = 14
    var smallRadius: CGFloat = 8
    var bigRadius: CGFloat = 18
    
    var sizeType: SizeType = .normal
    
    
    var body: some View {
        
        VStack {
            switch sizeType {
                case .normal:
                    normalView
                case .small:
                    smallView
                case .big:
                    bigView
            }
        }
    }
}

#Preview {
    VStack {
        AppIntro(appIntroModel: AppIntroModel(appCover: "chatgpt", appName: "ChatGPT", appDescription: "OpenAI,L.L.C"))
        AppIntro(appIntroModel: AppIntroModel(appCover: "chatgpt", appName: "ChatGPT", appDescription: "OpenAI,L.L.C"), sizeType: .small)
            .padding()
            .background {
                Color.green
            }
        AppIntro(appIntroModel: AppIntroModel(appCover: "chatgpt", appName: "ChatGPT", appDescription: "OpenAI,L.L.C"), sizeType: .big)
    }
    
    
}






extension AppIntro {
    
    //大视图
    var bigView: some View {
        NavigationLink {
            AppDetailView(appIntroModel: appIntroModel)
        } label: {
            HStack(spacing: 14) {
                Image(appIntroModel.appCover)
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: bigSize,
                        height: bigSize
                    )
                    .mask(RoundedRectangle(cornerRadius: bigRadius, style: .continuous))
                    .overlay {
                        RoundedRectangle(cornerRadius: bigRadius, style: .continuous)
                            .fill(Color.clear)
                            .stroke(Color.black.opacity(0.1), lineWidth: 1)
                    }
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text(appIntroModel.appName)
                            .fontWeight(.medium)
                        Text(appIntroModel.appDescription)
                            .font(.caption)
                            .foregroundStyle(Color.gray)
                        
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("获取")
                            .font(.callout)
                            .foregroundStyle(Color.blue)
                            .fontWeight(.medium)
                            .padding(6)
                            .padding(.horizontal, 12)
                            .background {
                                RoundedRectangle(cornerRadius: 90)
                                    .foregroundStyle(Color(uiColor: .systemGray6))
                            }
                    }
                }
                .frame(height: 90)
                
                
            Spacer()
            }
        }

        
            
    }
    
    //小视图
    var smallView: some View {
        HStack {
            Image(appIntroModel.appCover)
                .resizable()
                .scaledToFill()
                .frame(
                    width: smallSize,
                    height: smallSize
                )
                .mask(RoundedRectangle(cornerRadius: smallRadius, style: .continuous))
                .overlay {
                    RoundedRectangle(cornerRadius: smallRadius, style: .continuous)
                        .fill(Color.clear)
                        .stroke(Color.black.opacity(0.1), lineWidth: 1)
                }
            
            VStack(alignment: .leading) {
                Text(appIntroModel.appName)
                    .foregroundStyle(Color.white)
                    .fontWeight(.medium)
                Text(appIntroModel.appDescription)
                    .font(.caption)
                    .foregroundStyle(Color.white.opacity(0.6))
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Text("获取")
                    .font(.callout)
                    .foregroundStyle(Color.white)
                    .fontWeight(.medium)
                    .padding(6)
                    .padding(.horizontal, 12)
                    .background {
                        RoundedRectangle(cornerRadius: 90)
                            .foregroundStyle(Color.white.opacity(0.4))
                    }
            }
        }
    }
    
    //标准视图
    var normalView: some View {
        NavigationLink {
            AppDetailView(appIntroModel: appIntroModel)
        } label: {
            HStack {
                Image(appIntroModel.appCover)
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: normalSize,
                        height: normalSize
                    )
                    .mask(RoundedRectangle(cornerRadius: normalRadius, style: .continuous))
                    .overlay {
                        RoundedRectangle(cornerRadius: normalRadius, style: .continuous)
                            .fill(Color.clear)
                            .stroke(Color.black.opacity(0.1), lineWidth: 1)
                    }
                
                VStack(alignment: .leading) {
                    Text(appIntroModel.appName)
                        .foregroundStyle(Color.primary)
                        .fontWeight(.medium)
                    Text(appIntroModel.appDescription)
                        .font(.caption)
                        .foregroundStyle(Color.gray)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("获取")
                        .font(.callout)
                        .foregroundStyle(Color.blue)
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

        
    }
    
    
    
}
