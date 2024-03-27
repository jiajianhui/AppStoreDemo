//
//  AvatarView.swift
//  AppStoreDemo
//
//  Created by 贾建辉 on 2024/3/26.
//

import SwiftUI

struct AvatarView: View {
    
    @State var showSheet: Bool = false
    
    var body: some View {
        Button {
            showSheet = true
        } label: {
            Circle()
                .fill(Color.orange)
                .frame(width: 36)
        }
        .sheet(isPresented: $showSheet, content: {
            Text("1")
        })
    }
}

#Preview {
    AvatarView()
}
