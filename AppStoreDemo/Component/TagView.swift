//
//  AppTagView.swift
//  AppStoreDemo
//
//  Created by 贾建辉 on 2024/3/30.
//

import SwiftUI

struct TagView: View {
    
    var isGame: Bool
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                
                ForEach(isGame ? gameTags : appTags) { tag in
                    NavigationLink {
                        Text(tag.name)
                    } label: {
                        HStack(spacing: 4) {
                            Image(tag.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 22)
                            Text(tag.name)
                                .font(.system(size: 15, weight: .medium))
                        }
                        .foregroundStyle(Color.primary)
                        .fontWeight(.medium)
                        .padding(8)
                        .padding(.horizontal, 4)
                        .background {
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .foregroundStyle(Color.white)
                        }
                        .shadow(color: .primary.opacity(0.1), radius: 8, x: 0.0, y: 0)
                    }
                }
                
            }
            .padding(.horizontal, 20)
            
        }
        
        .frame(height: 80)
        .scrollClipDisabled()  //取消scrollview的裁切
    }
}

#Preview {
    TagView(isGame: true)
}
