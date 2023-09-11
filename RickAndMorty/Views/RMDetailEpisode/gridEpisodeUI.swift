//
//  gridEpisodeUI.swift
//  RickAndMorty
//
//  Created by Juan Camilo Fonseca Gomez on 21/08/23.
//

import SwiftUI

struct gridEpisodeUI: View {
    let gridItems = [GridItem(.flexible(minimum: 100, maximum: 200))]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItems, content: {
                //TODO: Add character's cell
            })
        }.frame(width: 200, height: nil).shadow(radius: 20).padding(10)
    }
}

#Preview {
    gridEpisodeUI()
}
