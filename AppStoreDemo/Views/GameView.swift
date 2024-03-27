//
//  GameView.swift
//  AppStoreDemo
//
//  Created by 贾建辉 on 2024/3/26.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("hello")
            }
            .navigationTitle("1")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("222")
                }
            }
            .toolbarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    GameView()
}
