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
            HStack {
                VStack(alignment: .leading,spacing: 10) {
                    Text("Name: ")
                        .padding()
                        .font(.largeTitle)
                    Text("Air date: ")
                        .padding()
                        .font(.largeTitle)
                    Text("Created: ")
                        .padding()
                        .font(.largeTitle)
                }
                Spacer()
            } .background(.white)
                .shadow(radius: 15)
                .clipShape(.buttonBorder)
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
