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
    
    @Binding var showBlurBG: Bool
    
    var body: some View {
        GeometryReader(content: { geometry in
            VStack {
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
            .frame(maxWidth: .infinity)
            .onChange(of: geometry.frame(in: .global).minY) { _, newValue in
                if newValue < 36 {
                    withAnimation(.easeIn(duration: 0.1)) {
                        showBlurBG = true
                    }
                    
                } else {
                    withAnimation(.easeOut) {
                        showBlurBG = false
                    }
                }
            }
        })
        .frame(height: 40)
        
    }
}

#Preview {
    HeaderView(title: "Hello", showDate: true, showBlurBG: .constant(true))
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
