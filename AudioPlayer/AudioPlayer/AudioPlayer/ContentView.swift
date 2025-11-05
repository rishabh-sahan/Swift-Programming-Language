//
//  ContentView.swift
//  AudioPlayer
//
//  Created by BATCH03L1 on 08/10/25.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var audioPlayer: AVPlayer? = nil
    var body: some View {
        VStack (spacing: 50) {
            Button("Play Sound") {
                audioPlayer?.play()
            }
            
            Button("Pause Sound") {
                audioPlayer?.pause()
            }
        }
        .onAppear {
            //let path = Bundle.main.path(forResource: "sample", ofType: "mp3")!
            //self.audioPlayer = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            
            audioPlayer = AVPlayer(url: URL(string: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3")!)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
