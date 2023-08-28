//
//  RMDetailEpisode.swift
//  RickAndMorty
//
//  Created by Juan Camilo Fonseca Gomez on 16/08/23.
//

import SwiftUI

struct RMDetailEpisode: View {
    var body: some View {
        VStack (alignment: .center, spacing: 10) {
            EpisodeCellUI().shadow(radius: 20)
            Rectangle().frame(width: .infinity, height: 10)
            Text("Characters")
                .font(.largeTitle)
                .padding()
            Spacer()
            gridEpisodeUI().clipShape(.rect, style: FillStyle())
        }.background(Color .white).padding()
            
    }
}

#Preview ("RMDetailEpisode"){
    RMDetailEpisode()
}
