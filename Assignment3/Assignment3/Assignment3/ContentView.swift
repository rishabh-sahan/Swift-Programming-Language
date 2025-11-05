//
//  ContentView.swift
//  Assignment3
//
//  Created by BATCH03L1 on 08/10/25.
//

import SwiftUI

struct Song: Identifiable {
    let id = UUID()
    let name: String
    let songLogo: Image
    let path: String?  // ✅ Optional to safely handle missing files
}

struct ContentView: View {
    // ✅ Song array with optional path
    var items = [
        Song(
            name: "Da Vinci",
            songLogo: Image("Da Vinci"),
            path: Bundle.main.path(forResource: "daVinci", ofType: "mp3")
        ),
        Song(
            name: "Suzume",
            songLogo: Image("images"),
            path: Bundle.main.path(forResource: "Suzume_No_Tojimari", ofType: "mp3")
        ),
        Song(
            name: "Carol of the bells",
            songLogo: Image("Unknown"),
            path: Bundle.main.path(forResource: "carol", ofType: "mp3")
        ),
        Song(
            name: "Carol of the bells",
            songLogo: Image("Unknown"),
            path: Bundle.main.path(forResource: "carol", ofType: "mp3")
        )
    ]
    
    var body: some View {
        NavigationStack {
            List(items) { song in
                NavigationLink(destination: SelectedSong(song: song)) {
                    HStack {
                        song.songLogo
                            .resizable()
                            .frame(width: 50, height: 50)
                            .cornerRadius(25)

                        VStack(alignment: .leading) {
                            Text(song.name)
                                .font(.caption)
                        }
                    }
                }
            }
            .navigationTitle("Song List")
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
