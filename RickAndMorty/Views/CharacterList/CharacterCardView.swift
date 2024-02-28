//
//  CharacterCardListView.swift
//  RickAndMorty
//
//  Created by Horacio Guzman on 23/02/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterCardView: View {
    
    let viewModel: CharacterCardViewModel
    var body: some View {
        Button(action: {}, label: {
                HStack {
                    VStack {
                        WebImage(url: viewModel.imageURL)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 150)
                            .cornerRadius(10.0)
                            .padding(2)
                    }
                    VStack(alignment: .leading) {
                        Text(viewModel.name ?? "")
                            .font(.headline)
                            .bold()
                            .padding(.top, 2)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                        setupStatus(text: viewModel.status.string, statusColor: viewModel.status)
                        Spacer()
                        Text(NSLocalizedString("Last location:", comment: ""))
                            .foregroundStyle(.secondary)
                        Text(viewModel.location ?? "")
                            .multilineTextAlignment(.leading)
                            .bold()
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.bottom, 2)
                    }
                    Spacer()
                }
        })
        .foregroundStyle(.primary)
        .background(.quinary)
        .clipShape(.rect(cornerRadius: 10))
        
    }
    
    @ViewBuilder
    private func setupStatus(text: String, statusColor: RMCharacter.Status) -> some View {
        VStack {
            Text(text)
                .foregroundStyle(.background)
                .bold()
                .padding(.horizontal)
                .background(statusColor.color)
                .clipShape(.capsule)
        }
    }
}

@Observable
final class CharacterCardViewModel {
    
    let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    var imageURL: URL? {
        URL(string: character.image)
    }
    
    var specie: String {
        character.species
    }
    
    var name: String? {
        character.name
    }
    
    var status: RMCharacter.Status {
        character.status
    }
    
    var location: String? {
        character.location.name
    }
}


#Preview {
    CharacterCardView(viewModel: .init(character: .init(id: 20, name: "Rick Sanchez", status: .alive, species: "Human", type: "Human", gender: .female, origin: .init(name: "Earth"), location: .init(name: "Name of a location that yould be put here"), image: "https://rickandmortyapi.com/api/character/avatar/3.jpeg", episode: [])))
}

#Preview {
    RMCharacterListView(viewModel: .init(dataProvider: RMDataProvider<RMCharacter, RMCharacterConfiguration>(entity: .init(configuration: .init()))))
}
