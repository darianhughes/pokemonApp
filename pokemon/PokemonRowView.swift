//
//  PokemonRowView.swift
//  pokemon
//
//  Created by HUGHES, DARIAN M. on 5/7/25.
//

import SwiftUI

struct PokemonRowView: View {
    let name: String
    @StateObject private var imageFetcher = PokemonImageFetcher()

    var body: some View {
        HStack {
            if let imageURL = imageFetcher.imageURL {
                AsyncImage(url: imageURL) { image in
                    image.resizable()
                         .scaledToFit()
                         .frame(width: 50, height: 50)
                } placeholder: {
                    ProgressView().frame(width: 50, height: 50)
                }
            } else {
                Color.gray.frame(width: 50, height: 50).cornerRadius(5)
            }

            Text(name.capitalized)
                .font(.headline)
        }
        .onAppear {
            imageFetcher.fetchImage(for: name)
        }
    }
}
