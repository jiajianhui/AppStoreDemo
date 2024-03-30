//
//  AppCardView.swift
//  AppStoreDemo
//
//  Created by 贾建辉 on 2024/3/30.
//

import SwiftUI

struct AppCardView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(0..<3) { _ in
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("新游狂欢")
                                .font(.caption)
                                .fontWeight(.medium)
                                .foregroundStyle(.blue)
                            VStack(alignment: .leading, spacing: 2) {
                                Text("仙境传说：爱如初见")
                                    .font(.title2)
                                Text("重温经典冒险 遇见感动与爱")
                                    .font(.title3)
                                    .foregroundStyle(Color(uiColor: .systemGray2))
                            }
                        }
                        
                        //图片
                        Image("01")
                            .resizable()
                            .scaledToFill()
                            .frame(
                                width: UIScreen.main.bounds.width - 40,
                                height: (UIScreen.main.bounds.width - 40) / 4 * 2.5
                            )
                            .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
                            .overlay {
                                RoundedRectangle(cornerRadius: 8, style: .continuous)
                                    .stroke(Color.black.opacity(0.1), lineWidth: 1)
                            }
                            
                    }
                    .padding(.bottom, 2)
                }
            }
            .scrollTargetLayout()
            
        }
        .safeAreaPadding(.horizontal, 20)
        .scrollTargetBehavior(.paging)  //iOS17的新功能
    }
}

#Preview {
    AppCardView()
}
