//
//  TodayView.swift
//  AppStoreDemo
//
//  Created by 贾建辉 on 2024/3/24.
//

import SwiftUI

struct TodayView: View {
    
    @Binding var showDetail: Bool
    @Binding var selectedID: UUID
    
    var nameSpace: Namespace.ID
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                HeaderView(title: "Today", showDate: true)
                    
                
                VStack(spacing: 24) {
                    if !showDetail {
                        ForEach(cards) { card in
                            CardView(cardContent: card, showDetail: $showDetail, selectedID: $selectedID, nameSpace: nameSpace)
                        }
                    } else {  //去除多视图同时存在的报错提示（因为isSource: true）
                        ForEach(cards) { card in
                            emptyCardView
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity)
            
        }
    }
}

struct TodayView_Previews: PreviewProvider {
    
    @Namespace static var nameSpace
    static var previews: some View {
        TodayView(showDetail: .constant(false), selectedID: .constant(UUID()), nameSpace: nameSpace)
    }
    
}

//#Preview {
//    @Namespace var nameSpace
//    TodayView(showDetail: .constant(false), selectedID: .constant(UUID()), nameSpace: nameSpace)
//}


//日期
extension TodayView {
    
    
    //占位视图
    var emptyCardView: some View {
        VStack(alignment: .leading) { }
            .frame(
                width: UIScreen.main.bounds.width - 40,
                height: (UIScreen.main.bounds.width - 40) + 30
            )
            
            .mask(
                RoundedRectangle(cornerRadius: 24, style: .continuous)
            )
            
            .background {
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .fill(Color.white)
            }
    }
    
}
