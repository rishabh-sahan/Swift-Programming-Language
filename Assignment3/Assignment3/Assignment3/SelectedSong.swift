//
//  SelectedSong.swift
//  Assignment3
//
//  Created by BATCH03L1 on 08/10/25.
//


import SwiftUI
import AVFoundation

struct SelectedSong: View {
    var song: Song
    @State private var audioPlayer: AVAudioPlayer? = nil

    var body: some View {
        VStack {
            song.songLogo
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(50)

            Text("Name: \(song.name)")
                .font(.title)
                .padding()

            Spacer()

            VStack(spacing: 50) {
                Button("Play Sound") {
                    audioPlayer?.play()
                }
                .buttonStyle(.borderedProminent)

                Button("Pause Sound") {
                    audioPlayer?.pause()
                }
                .buttonStyle(.bordered)
            }
            .padding(.top, 50)

            Spacer()
        }
        .navigationTitle("Song Details")
        .padding()
        .onAppear {
            if let path = song.path {
                let url = URL(fileURLWithPath: path)
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: url)
                    audioPlayer?.prepareToPlay()
                } catch {
                    print("Failed to initialize audio player: \(error)")
                }
            } else {
                print("Audio file not found.")
            }
        }
    }
}

#Preview {
    SelectedSong(song: Song(name: "Da Vinci", songLogo: Image("Da Vinci"), path: nil))
}
