//
//  EpisodeCellUI.swift
//  RickAndMorty
//
//  Created by Juan Camilo Fonseca Gomez on 21/08/23.
//

import SwiftUI

struct EpisodeCellUI: View {
    var body: some View {

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
        }.background(.white)
        .shadow(radius: 15)
        .clipShape(.buttonBorder)
    }
}

#Preview {
    EpisodeCellUI()
}
