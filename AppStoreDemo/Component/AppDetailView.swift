//
//  AppDetailView.swift
//  AppStoreDemo
//
//  Created by 贾建辉 on 2024/4/3.
//

import SwiftUI

struct AppDetailView: View {
    
    var appIntroModel: AppIntroModel
    
    @State var showSmallLogo: Bool = false
    @State var showBackBtn: Bool = false
    @State var navibarOpcity: CGFloat = 0
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            cover
            
            AppIntro(appIntroModel: appIntroModel, sizeType: .big)
                .offset(y: 240)
                .padding(. horizontal)
                .disabled(true)
                .opacity(showSmallLogo ? 0 : 1)
            
            Rectangle()
                .fill(Color.green)
                .frame(height: 1000)
                .offset(y: 260)
        }
        .coordinateSpace(name: "appdetail")
        .toolbar(.hidden, for: .automatic)
        
        .overlay(alignment: .top) {
            blurBg
        }
        
        .ignoresSafeArea() //放在最下面，避免下拉时，图片不能填充安全区
        
    }
}

#Preview {
    AppDetailView(appIntroModel: AppIntroModel(appCover: "chatgpt", appName: "ChatGPT", appDescription: "OpenAI,L.L.C"))
}

extension AppDetailView {
    var cover: some View {
        GeometryReader { proxy in
            let scrollY = proxy.frame(in: .named("appdetail")).minY
            let height =  240 + (scrollY > 0 ? scrollY  : 0)
            
            Image(appIntroModel.appCover)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: height)
                .mask(Rectangle().frame(height: height))  //将超出的页面裁剪掉
            
                .offset(y: scrollY > 0 ? -scrollY : 0)
                
                //监测视图的顶部相对于屏幕顶部的距离
                .onChange(of: proxy.frame(in: .global).minY) { _, newValue in
                    if -newValue >= 220 {
                        withAnimation(.easeIn) {
                            showSmallLogo = true
                        }
                    } else {
                        withAnimation(.easeIn) {
                            showSmallLogo = false
                        }
                    }
                    
                    if -newValue >= 50 {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            showBackBtn = true
                        }
                    } else {
                        withAnimation(.easeIn(duration: 0.1)) {
                            showBackBtn = false
                        }
                    }
                    
//                    print(newValue)
                    navibarOpcity = -newValue * 0.01
                }
            
        }
    }
    
    var backBtn: some View {
        Button {
            dismiss()
        } label: {
            HStack(spacing: 6) {
                Image(systemName: "chevron.left")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 11)
                
                    .fontWeight(.medium)
                Text("返回")
                    .font(.system(size: 17, weight: .regular))
            }
            .frame(width: 100, alignment: .leading)
            
        }
        .opacity(showBackBtn ? 1 : 0)
    }
    
    var backCircleBtn: some View {
        Button {
            dismiss()
            
        } label: {
            ZStack {
                Circle()
                    .foregroundStyle(Color.primary.opacity(0.4))
                    .frame(width: 30)
                    .foregroundStyle(Color.primary.opacity(0.4))
                Image(systemName: "chevron.backward")
                    .resizable()
                    .scaledToFit()
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                    .frame(width: 12, height: 12)
                    
            }
            .frame(width: 100, alignment: .leading)
        }
        .offset(x: showBackBtn ? -50 : 0)
    }
    
    
    var smallLogo: some View {
        Image(appIntroModel.appCover)
            .resizable()
            .scaledToFill()
            .frame(
                width: 30,
                height: 30
            )
            .mask(RoundedRectangle(cornerRadius: 6, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: 6, style: .continuous)
                    .fill(Color.clear)
                    .stroke(Color.black.opacity(0.1), lineWidth: 1)
            }
            .opacity(showSmallLogo ? 1 : 0)
            .offset(y: showSmallLogo ? 0 : 6)
    }
    
    var downLoadBtn: some View {
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
                        .foregroundStyle(Color.blue)
                }
            
                .frame(width: 100, alignment: .trailing)
                .opacity(showSmallLogo ? 1 : 0)
                .offset(y: showSmallLogo ? 0 : 6)
        }
    }
    
    var blurBg: some View {
        Rectangle()
            .fill(Material.regular)
            .frame(height: 100)
            .opacity(navibarOpcity)
        
            .overlay(alignment: .bottom) {
                HStack(content: {
                    ZStack {
                        backBtn
                        backCircleBtn
                    }
                    Spacer()
                    smallLogo
                    Spacer()
                    downLoadBtn
                })
                .padding(.horizontal)
                .offset(y: -10)
            }
            .ignoresSafeArea()
    }
    
}
