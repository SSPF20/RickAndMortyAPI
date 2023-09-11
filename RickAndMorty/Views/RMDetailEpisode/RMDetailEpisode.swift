//
//  RMDetailEpisode.swift
//  RickAndMorty
//
//  Created by Juan Camilo Fonseca Gomez on 16/08/23.
//

import SwiftUI

struct RMDetailEpisode: View {
    
    var viewModel : DetailEpisodeViewModel
    
    var body: some View {
        VStack (alignment: .center, spacing: 10) {
            HStack {
                VStack(alignment: .leading,spacing: 10) {
                    Text(NSLocalizedString("Name: \(viewModel.name)", comment: ""))
                        .padding()
                        .font(.title3)
                    Text(NSLocalizedString("Air date: \(viewModel.airDate)", comment: ""))
                        .padding()
                        .font(.title3)
                    Text(NSLocalizedString("Created: \(viewModel.created)", comment: ""))
                        .padding()
                        .font(.title3)
                        .fixedSize(horizontal: false, vertical: true)
                }
                Spacer()
            } .background(.white)
                .shadow(radius: 15)
                .clipShape(.buttonBorder)
            Rectangle().frame(width: 200, height: 10)
            Text("Characters")
                .font(.largeTitle)
                .padding()
            Spacer()
            gridEpisodeUI().clipShape(.rect, style: FillStyle())
        }.background(Color .white).padding()
        
    }
}

#Preview ("RMDetailEpisode"){
    RMDetailEpisode(viewModel: .init(episode: .init(id: 1, name: "first Episode", airDate: "2023", episode: "233", characterIds: [1], url: "", created: Date())))
}
