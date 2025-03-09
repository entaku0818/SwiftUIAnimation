//
//  EqualizerView.swift
//  SwiftUIAnimation
//
//  Created by 遠藤拓弥 on 2025/03/09.
//

import SwiftUI

struct EqualizerView: View {
    let data: [CGFloat]
    let isPlaying: Bool
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<10, id: \.self) { index in
                VStack(spacing: 2) {
                    ForEach(0..<8, id: \.self) { barIndex in
                        RoundedRectangle(cornerRadius: 2)
                            .fill(
                                barIndex < Int(data[index % data.count] * 8) ? 
                                    (barIndex < 3 ? Color.green : barIndex < 6 ? Color.yellow : Color.red) : 
                                    Color.gray.opacity(0.3)
                            )
                            .frame(height: 8)
                    }
                }
                .frame(width: 20)
            }
        }
    }
}
