//
//  SomeRandomView.swift
//  RickAndMorty
//
//  Created by Horacio Guzman on 23/02/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct RMCharacterListView: View {
    
    var viewModel: RMCharacterListViewModel
    
    private let columns = [GridItem(.flexible(minimum: 100))]
    
    var body: some View {
        ScrollView {
            VStack {
                LazyVGrid(columns: columns, spacing: 10, content: {
                    ForEach(viewModel.characters, id: \.self) { character in
                        CharacterCardView(viewModel: .init(character: character))
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.horizontal)
                        
                
                    }
                })
            }.onAppear() {
                viewModel.start(page: 1)
        }
        }
    }
}

@Observable class RMCharacterListViewModel {
    
    let dataProvider: RMDataProvider<RMCharacter, RMCharacterConfiguration>
    var characters: [RMCharacter] = []
    
    init(dataProvider: RMDataProvider<RMCharacter, RMCharacterConfiguration>) {
        self.dataProvider = dataProvider
    }
    
    func start(page: Int) {
        Task {
            let response = try await dataProvider.getPage(page: page)
            characters.append(contentsOf: response.results)
        }
    }
}

#Preview {
    RMCharacterListView(viewModel: .init(dataProvider: RMDataProvider<RMCharacter, RMCharacterConfiguration>(entity: .init(configuration: .init()))))
}
