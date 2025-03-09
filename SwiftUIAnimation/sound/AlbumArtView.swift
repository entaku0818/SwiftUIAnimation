//
//  AlbumArtView.swift
//  SwiftUIAnimation
//
//  Created by 遠藤拓弥 on 2025/03/10.
//

import SwiftUI

// アルバムアートビュー
struct AlbumArtView: View {
    let imageName: String?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.2))
                .frame(width: 200, height: 200)
            
            if let imageName = imageName {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .cornerRadius(12)
            } else {
                Image(systemName: "music.note")
                    .font(.system(size: 80))
                    .foregroundColor(.gray.opacity(0.7))
            }
        }
    }
}
