//
//  CardDetailView.swift
//  AppStoreDemo
//
//  Created by 贾建辉 on 2024/3/25.
//

import SwiftUI

struct CardDetailView: View {
    
    var cardContent: CardContentModel
    
    @Binding var showDetail: Bool
    @Binding var selectedID: UUID
    
    private let cornerRadius: CGFloat = 40
    @State private var showCloseBtn: Bool = false
    
    
    //命名空间
    var nameSpace: Namespace.ID
    
    var body: some View {
        ScrollView {
            ZStack {
                cover
                info
            }
        }
        .coordinateSpace(name: "detail")
        .mask(
            maskShape
        )
        .background {
            bgShape
        }
        
        .overlay(alignment: .topTrailing) {
            closeBtn
            
        }
        .ignoresSafeArea()
        .statusBar(hidden: true)
    }
}

struct CardDetailView_Previews: PreviewProvider {
    @Namespace static var nameSpace
    static var previews: some View {
        CardDetailView(cardContent: CardContentModel(cover: "01", title: "1", description: "1"), showDetail: .constant(true), selectedID: .constant(UUID()), nameSpace: nameSpace)
    }
    
}

extension CardDetailView {
    
    //关闭按钮
    var closeBtn: some View {
        Button {
            withAnimation(.closeCard) {
                showDetail = false
                selectedID = UUID()
            }
            
        } label: {
            ZStack {
                Circle()
                    .frame(width: 36)
                    .foregroundStyle(Color.primary.opacity(0.4))
                Image(systemName: "xmark")
                    .resizable()
                    .scaledToFit()
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                    .frame(width: 12, height: 12)
                    
            }
        }
        .offset(x: showCloseBtn ? -20.0 : 40, y: 30.0)
//        .opacity(showCloseBtn ? 1 : 1)
        //延迟出现
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                withAnimation(.spring()) {
                    showCloseBtn = true
                }
            }
        }
    }
    
    //图片
    var cover: some View {
        GeometryReader { proxy in
            let scrollY = proxy.frame(in: .named("detail")).minY
            let height = UIScreen.main.bounds.width + (scrollY > 0 ? scrollY  : 0)
            
            Image(cardContent.cover)
                .resizable()
                .scaledToFill()
                .matchedGeometryEffect(id: "cover\(cardContent.id)", in: nameSpace, isSource: true)  //一定要在frame上面
                .frame(width: UIScreen.main.bounds.width, height: height)
                .offset(y: scrollY > 0 ? -scrollY : 0)
        }
        
    }
    
    //文案
    var info: some View {
        VStack(alignment: .leading) {
            Text(cardContent.title)
                .font(.system(size: 40, weight: .bold))
                .matchedGeometryEffect(id: "title\(cardContent.id)", in: nameSpace, isSource: true)
            
            Text(cardContent.description)
        }
        .foregroundStyle(Color.primary)
        .padding()
        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
//        .background {
//            ZStack {
//                Image(cardContent.cover)
//                    .resizable()
//                    .scaledToFill()
//                    .matchedGeometryEffect(id: "coverBlur\(cardContent.id)", in: nameSpace, isSource: true)
//                    .frame(height: 80)
//                
//                    .blur(radius: 100)
//                    
//                
//                Color.black.opacity(0.1)
//            }
//            .mask(
//                Rectangle()
//            )
//            
//        }
        
        .offset(y: UIScreen.main.bounds.width)
    }
    
    //mask
    var maskShape: some View {
        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
            .fill(Color.white)
            .matchedGeometryEffect(id: "mask\(cardContent.id)", in: nameSpace, isSource: true)
    }
    
    //bg
    var bgShape: some View {
        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
            .fill(Color.white)
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 10)
            .matchedGeometryEffect(id: "bg\(cardContent.id)", in: nameSpace, isSource: true)
    }
    
}
