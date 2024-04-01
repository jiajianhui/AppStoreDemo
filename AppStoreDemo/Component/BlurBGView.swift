//
//  BlurBGView.swift
//  AppStoreDemo
//
//  Created by 贾建辉 on 2024/4/1.
//

import SwiftUI

struct BlurBGView: View {
    
    @Binding var showBlurBG: Bool
    var title: String
    var height: CGFloat = 90
    
    var body: some View {
        Rectangle()
            .fill(Material.regular)
            .frame(height: height)
            .overlay(alignment: .bottom) {
                Text(title)
                    .fontWeight(.bold)
                    .padding(12)
            }
            .ignoresSafeArea()
            .opacity(showBlurBG ? 1 : 0)
    }
}

#Preview {
    BlurBGView(showBlurBG: .constant(true), title: "App")
}
