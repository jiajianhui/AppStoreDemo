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
                HStack(alignment: .center) {
                    Text("Today")
                        .font(.system(size: 36, weight: .bold))
                    date
                    Spacer()
                    AvatarView()
                }
                .frame(width: UIScreen.main.bounds.width - 40)
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

//#Preview {
//    @Namespace var nameSpace
//    TodayView(showDetail: .constant(false), selectedID: .constant(UUID()), nameSpace: nameSpace)
//}


//日期
extension TodayView {
    
    //日期
    var date: some View {
        Text(currentDateText)
            .font(.system(size: 22, weight: .bold))
            .baselineOffset(-10)
            .opacity(0.4)
    }
    
    var currentDateText: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M月d日"
        
        return dateFormatter.string(from: Date())
    }
    
    
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
