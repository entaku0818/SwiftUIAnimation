//
//  TrackInfoView.swift
//  SwiftUIAnimation
//
//  Created by 遠藤拓弥 on 2025/03/10.
//

import SwiftUI

// トラック情報ビュー
struct TrackInfoView: View {
    let track: AudioTrack
    
    var body: some View {
        VStack(spacing: 2) {
            HStack {
                VStack(alignment: .leading) {
                    Text(track.title)
                        .font(.headline)
                        .fontWeight(.bold)
                    Text(track.artist)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            
            Spacer()
                .frame(height: 20)
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("ファイル形式")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(track.fileFormat)
                        .font(.caption2)
                }
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("ビットレート")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(track.bitrate)
                        .font(.caption2)
                }
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("サンプルレート")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(track.sampleRate)
                        .font(.caption2)
                }
            }
        }
    }
}

