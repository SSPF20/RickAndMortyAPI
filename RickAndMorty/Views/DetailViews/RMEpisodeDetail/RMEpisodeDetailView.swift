//
//  RMEpisodeDetailView.swift
//  RickAndMorty
//
//  Created by Juan Camilo Fonseca Gomez on 14/10/23.
//

import SwiftUI

struct RMEpisodeDetailView: View {
    
    var viewModel : RMEpisodeDetailViewModel
    let gridItems = [GridItem(.flexible(minimum: 80)),
                     GridItem(.flexible(minimum: 80))]
    var body: some View {
        VStack (alignment: .center, spacing: 3) {
            HStack {
                VStack(alignment: .leading,spacing: 3) {
                    Text(NSLocalizedString("Name: \(viewModel.name)", comment: ""))
                        .padding()
                        .font(.title3)
                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    Text(NSLocalizedString("Air date: \(viewModel.airDate)", comment: ""))
                        .padding()
                        .font(.title3)
                    Text(NSLocalizedString("Created: \(viewModel.created)", comment: ""))
                        .padding()
                        .font(.title3)
                        .fixedSize(horizontal: false, vertical: true)
                }
            } .background(.white)
                .shadow(radius: 10)
                .clipShape(.buttonBorder)
            Divider()
            .frame(height: 5)
            .overlay(.primary)
            .cornerRadius(10)
            .padding()
            Text("Characters")
                .font(.title2)
                .padding()
                .fontWeight(.bold)
            Spacer()

            ScrollView {
                LazyVGrid(columns: gridItems, content: {
                    ForEach(viewModel.characters, id: \.self ) { num in
                        RMCharacterCardView(viewModel: .init(id: num))
                    }
                })
            }.frame(width: 350, height: nil).shadow(radius: 20).padding(10)
        }.background(Color .white)
    }
}

#Preview {
    RMEpisodeDetailView(viewModel: .init(episode: .init(id: 1, name: "first Episode", airDate: "2023", episode: "233", characters: [1], url: "", created: Date())))
    
}
