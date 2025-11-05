//
//  ContentView.swift
//  VideoPlayer
//
//  Created by BATCH03L1 on 08/10/25.
//

import SwiftUI
import AVKit

struct ContentView: View {
    var body: some View {
        VStack {
            
            //            let url = URL(string: "")!
            
            let path = Bundle.main.path(forResource: "SampleVideo", ofType: "mp4")!
            let url = URL(fileURLWithPath: path)
            VideoPlayer(player: AVPlayer(url: url)) {
            }
        }
    }
}
#Preview {
    ContentView()
}
