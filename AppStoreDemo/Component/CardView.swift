//
//  CardView.swift
//  AppStoreDemo
//
//  Created by 贾建辉 on 2024/3/24.
//

import SwiftUI

struct CardView: View {
    
    var cardContent: CardContentModel
    
    let cornerRadius: CGFloat = 24
    
    @Binding var showDetail: Bool
    @Binding var selectedID: UUID
    
    //命名空间
    var nameSpace: Namespace.ID
    
    var body: some View {
        Button {
            withAnimation(.openCard) {
                showDetail = true
                selectedID = cardContent.id
            }
            
            
            
        } label: {
            VStack(alignment: .leading, spacing: 0) {
                cover
//                info
            }
            .frame(
                width: UIScreen.main.bounds.width - 40,
                height: (UIScreen.main.bounds.width - 40) + 20
            )
            
            .mask(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .matchedGeometryEffect(id: "mask\(cardContent.id)", in: nameSpace, isSource: true)
            )
            
            .background {
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(Color.white)
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 10)
                    .matchedGeometryEffect(id: "bg\(cardContent.id)", in: nameSpace, isSource: true)
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    
    @Namespace static var nameSpace
    static var previews: some View {
        CardView(cardContent: CardContentModel(cover: "01", title: "1", description: "1"), showDetail: .constant(false), selectedID: .constant(UUID()), nameSpace: nameSpace)
    }
    
}

extension CardView {
    
    //图片
    private var cover: some View {
        Image(cardContent.cover)
            .resizable()
            .scaledToFill()
            //缩放效果
            .matchedGeometryEffect(id: "cover\(cardContent.id)", in: nameSpace, isSource: true)  //一定要在frame上面
            .frame(
                width: UIScreen.main.bounds.width - 40,
                height: UIScreen.main.bounds.width - 40 + 20
            )
            .overlay(alignment: .bottom) {
                info
            }
    }
    
    //文案
    private var info: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(cardContent.title)
                .font(.title)
                .fontWeight(.bold)
            
                .matchedGeometryEffect(id: "title\(cardContent.id)", in: nameSpace, isSource: true)
            Text(cardContent.description)
                .opacity(0.4)
                .matchedGeometryEffect(id: "subTitle\(cardContent.id)", in: nameSpace, isSource: true)
        }
        .foregroundStyle(Color.white)
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 80)
        .padding(.horizontal, 24)
        .background {
            ZStack {
                Image(cardContent.cover)
                    .resizable()
                    .scaledToFill()
                    .matchedGeometryEffect(id: "coverBlur\(cardContent.id)", in: nameSpace, isSource: true)
                    .frame(height: 80)
                
                    .blur(radius: 20)
                    .mask(
                        RoundedRectangle(cornerRadius: 0)
                            .matchedGeometryEffect(id: "coverMask\(cardContent.id)", in: nameSpace, isSource: true)
                    )
                
                Color.black.opacity(0.1)
                    .matchedGeometryEffect(id: "coverBlack\(cardContent.id)", in: nameSpace, isSource: true)
            }
            
        }
    }
    
    
    
}
