//
//  ContentView.swift
//  JokesApp
//
//  Created by BATCH03L1 on 24/10/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var jokeService = JokesAPIService()
//    @State private var isLoading = false
    @State private var isBig = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Jokes! 😆")
                .font(.largeTitle)
                .bold()
                .padding(.top, 50)
            
            VStack(alignment: .leading, spacing: 15) {
//                if isLoading {
//                    // Spinner while loading
//                    HStack {
//                        Spacer()
//                        ProgressView("Loading Joke...")
//                            .progressViewStyle(CircularProgressViewStyle(tint: .red))
//                            .font(.headline)
//                        Spacer()
//                    }
//                }
                if isBig {
                    HStack {
                        Spacer()
                        ProgressView("Loading Joke...")
                            .progressViewStyle(CircularProgressViewStyle(tint: .red))
                            .font(.headline)
                        Spacer()
                    }
                } else {
                    // Show the joke
                    if let joke = jokeService.joke {
                        Text("Setup:")
                            .font(.headline)
                            .foregroundColor(.red)
                        
                        Text(joke.setup)
                            .font(.title3)
                            .multilineTextAlignment(.leading)
                        
                        Text("Punchline:")
                            .font(.headline)
                            .foregroundColor(.red)
                        
                        Text(joke.punchline)
                            .font(.title3)
                            .multilineTextAlignment(.leading)
                    } else {
                        Text("Tap 'Get Joke' to load one!")
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
            .padding(.horizontal)
            
            Button(action: {
                VStack(spacing: 40) {
                    Image(systemName: "smiley.fill")
                        .resizable()
                        .frame(width: isBig ? 200 : 100, height: isBig ? 200 : 100)
                        .animation(.easeInOut(duration: 0.5).repeatForever(), value: isBig)
                }
//                Task {
//                    isLoading = true
//                    await jokeService.fetchJoke()
//                    isLoading = false
//                    
//                }
                Task {
                    isBig = true
                    await jokeService.fetchJoke()
                    isBig = false
                }
            }) {
                Text("Get Joke")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding()
                    .frame(width: 150)
                    .background(isBig ? Color.gray : Color.red)
                    .cornerRadius(10)
            }
            .disabled(isBig)
            Spacer()
            
            Text("Joke Type: Programming")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .background(Color(UIColor.systemGroupedBackground))
        .onAppear {
            Task {
                isBig = true
                await jokeService.fetchJoke()
                isBig = false
            }
        }
    }
}

#Preview {
    ContentView()
}
