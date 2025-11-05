//
//  JokesAPIService.swift
//  JokesApp
//
//  Created by BATCH03L1 on 24/10/25.
//

import Foundation

struct Joke: Codable {
    let setup: String
    let punchline: String
}

@MainActor
class JokesAPIService: ObservableObject {
    @Published var joke: Joke?

    func fetchJoke() async {
        guard let url = URL(string: "https://official-joke-api.appspot.com/jokes/programming/random") else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedJoke = try? JSONDecoder().decode([Joke].self, from: data).first {
                joke = decodedJoke
            }
        } catch {
            print("Error fetching joke: \(error.localizedDescription)")
        }
    }
}
