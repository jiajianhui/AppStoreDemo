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
    
    //手势相关的变量
    @State var dragDistance: CGFloat = 0
    
    var body: some View {
        ScrollView {
            cover
            content
        }
        .frame(height: UIScreen.main.bounds.height)  //解决下拉时顶部出现空白的问题
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
        .scaleEffect(1 - (dragDistance / 500))  //它的位置很重要，不然会有奇怪的效果
        .background(Material.ultraThinMaterial) //缩放的过程中，用毛玻璃盖住主界面
        
        .ignoresSafeArea()
        .statusBar(hidden: true)
        
        //自定义手势
        .gesture(drag)
        
        
    }
}

struct CardDetailView_Previews: PreviewProvider {
    @Namespace static var nameSpace
    static var previews: some View {
        CardDetailView(cardContent: CardContentModel(cover: cards[0].cover, title: cards[0].title, subTitle: cards[0].subTitle, description: cards[0].description), showDetail: .constant(true), selectedID: .constant(UUID()), nameSpace: nameSpace)
    }
    
}


//MARK: - 组件
extension CardDetailView {
    
    //关闭按钮
    var closeBtn: some View {
        Button {
            close()
            
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
        
        //随着拖动距离（大于120），逐渐消失
        .opacity((120 - dragDistance) / 120)
        
        //延迟出现
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                withAnimation(.closeBtn) {
                    showCloseBtn = true
                }
            }
        }
    }
    
    //图片
    var cover: some View {
        GeometryReader { proxy in
            let scrollY = proxy.frame(in: .named("detail")).minY
            let height = 460 + (scrollY > 0 ? scrollY  : 0)
            
            Image(cardContent.cover)
                .resizable()
                .scaledToFill()
                .matchedGeometryEffect(id: "cover\(cardContent.id)", in: nameSpace, isSource: true)  //一定要在frame上面
                .frame(width: UIScreen.main.bounds.width, height: height)
                .mask(Rectangle().frame(height: height))  //将超出的页面裁剪掉
                .overlay(alignment: .bottom) {
                    info
                }
                .offset(y: scrollY > 0 ? -scrollY : 0)
        }
        
    }
    
    //标题
    var info: some View {
        VStack(alignment: .leading) {
            Text(cardContent.title)
                .font(.system(size: 26, weight: .bold))
                .matchedGeometryEffect(id: "title\(cardContent.id)", in: nameSpace, isSource: true)
            
            Text(cardContent.subTitle)
                .matchedGeometryEffect(id: "subTitle\(cardContent.id)", in: nameSpace, isSource: true)
        }
        .foregroundStyle(Color.white)
        .padding()
        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
        .frame(height: 80)
        .background {
            ZStack {
                Image(cardContent.cover)
                    .resizable()
                    .scaledToFill()
                    .matchedGeometryEffect(id: "coverBlur\(cardContent.id)", in: nameSpace, isSource: true)
                    .frame(height: 80)
                
                    .blur(radius: 20)
                    
                
                Color.black.opacity(0.1)
                    .matchedGeometryEffect(id: "coverMask\(cardContent.id)", in: nameSpace, isSource: true)
            }
            .mask(
                Rectangle()
                    .matchedGeometryEffect(id: "coverBlack\(cardContent.id)", in: nameSpace, isSource: true)
            )
            
        }
    }
    
    //内容
    var content: some View {
        Text(cardContent.description)
            .foregroundStyle(Color(uiColor: .systemGray))
            .padding(8)
            .padding(.horizontal, 10)
            .padding(.top, 50)
            .lineSpacing(6)
            .frame(width: UIScreen.main.bounds.width, height: 1000 , alignment: .leading)
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
    
    //关闭函数
    func close() {
        withAnimation(.closeCard) {
            showDetail = false
            selectedID = UUID()
        }
    }
    
}

//MARK: - 自定义手势
extension CardDetailView {
    var drag: some Gesture {
        DragGesture(minimumDistance: 30, coordinateSpace: .local) //最低移动30的距离，手势才会被识别
        
            //手势拖动时的回调
            .onChanged { value in
                if value.startLocation.x < 120 {  //拖动手势开始时用户触摸屏幕的X坐标位置
                    withAnimation(.closeCard) {
                        dragDistance = abs(value.translation.width)  //当前手势距离手势开始时的距离
                    }
                    
                }
                
                if dragDistance > 120 {
                    close()
                }
            }
        
            //手势结束后的回调
            .onEnded { value in
                if dragDistance > 100 {
                    close()
                } else {
                    withAnimation(.openCard) {
                        dragDistance = 0
                    }
                    
                }
            }
    }
    
}
