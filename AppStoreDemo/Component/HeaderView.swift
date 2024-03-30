//
//  HeaderView.swift
//  AppStoreDemo
//
//  Created by 贾建辉 on 2024/3/29.
//

import SwiftUI

struct HeaderView: View {
    
    var title: String
    var showDate: Bool
    
    
    var body: some View {
        HStack(alignment: .center) {
            Text(title)
                .font(.system(size: 36, weight: .bold))
            date
                .opacity(showDate ? 1 : 0)
            Spacer()
            AvatarView()
        }
        .frame(width: UIScreen.main.bounds.width - 40)
    }
}

#Preview {
    HeaderView(title: "Hello", showDate: true)
}


extension HeaderView {
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
}
