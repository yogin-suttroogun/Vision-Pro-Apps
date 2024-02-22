//
//  ContentView.swift
//  GifsGenerator
//
//  Created by Suttroogun Yogin on 22/02/2024.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    @State private var gifUrl: URL?

    var body: some View {
        VStack {
            if let gifUrl = gifUrl {
                AsyncImage(
                    url: gifUrl,
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 450, height: 450)
                }, placeholder: {
                    ProgressView()
                })
                .padding(8)
            }
                
            Button("Fetch Random GIFs") {
                fetchRandomGifs()
            }
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
    
    func fetchRandomGifs() {
        let apiKey = Bundle.main.infoDictionary?["GIF_API_KEY"] as? String
        let url = URL(string: "https://api.giphy.com/v1/gifs/random?api_key=\(apiKey ?? "")")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(RandomGiphyResponse.self, from: data) {
                    DispatchQueue.main.async {
                        self.gifUrl = URL(string: response.data.images.fixed_height.url)
                    }
                }
            }
        }
        task.resume()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
