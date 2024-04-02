//
//  TagDetailView.swift
//  AppStoreDemo
//
//  Created by 贾建辉 on 2024/4/2.
//

import SwiftUI

struct TagDetailView: View {
    
    var tagModel: TagModel
    
    
    var body: some View {
        NavigationStack {
            Text(tagModel.name)
                
                .navigationTitle(tagModel.name)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    TagDetailView(tagModel: TagModel(image: "", name: "hello"))
}
