//
//  SomeRandomView.swift
//  RickAndMorty
//
//  Created by Horacio Guzman on 23/02/24.
//

import SwiftUI
import SDWebImageSwiftUI
import Observation

struct RMCharacterListView: View {
    
    private var viewModel: RMCharacterListViewModel
    private let columns = [GridItem(.flexible(minimum: 100))]
    
    init(viewModel: RMCharacterListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10, content: {
                
                ForEach(viewModel.characters, id: \.self) { character in
                    CharacterCardView(viewModel: .init(character: character), action: { viewModel.characterSelected(character: character) })
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.horizontal)
                        .onAppear(perform: {
                            viewModel.appear(characterID: character.id)
                        })
                }
                if viewModel.loading {
                    ProgressView {
                        Text(NSLocalizedString("Loading", comment: ""))
                    }
                    .font(.title)
                    .padding()
                }
            })
        }
        .overlay {
            if viewModel.characters.isEmpty, !viewModel.loading {
                ContentUnavailableView(label: {
                    Label(NSLocalizedString("No Characters Found", comment: ""), systemImage: "person.fill.xmark")
                }, description: {
                    Text(NSLocalizedString("Something Happened", comment: ""))
                }, actions: {
                    Button(NSLocalizedString("Try again", comment: "")) {
                        viewModel.start()
                    }
                })
            }
        }
        .onAppear(perform: {
            viewModel.start()
        })
    }
}

protocol RMCharacterListViewModel {
    var characters: [RMCharacter] { get }
    var loading: Bool { get }
    
    func start()
    func appear(characterID: Int)
    func characterSelected(character: RMCharacter)
}

@Observable class DefaultRMCharacterListViewModel: RMCharacterListViewModel {
    
    private let dataProvider: RMDataProvider<RMCharacter, RMCharacterConfiguration>
    private var currentPage = 0
    var characters: [RMCharacter] = []
    var loading = false
    
    var coordinator: Coordinator?
    
    init(dataProvider: RMDataProvider<RMCharacter, RMCharacterConfiguration>) {
        self.dataProvider = dataProvider
    }
    
    func start() {
        getPage(page: 1)
    }
    
    func appear(characterID: Int) {
        guard let lastCharacterID = characters.last?.id else { return }
        if characterID == lastCharacterID {
            getPage(page: currentPage + 1)
        }
    }
    
    func characterSelected(character: RMCharacter) {
        coordinator?.pushCharacterDetail(character: character)
    }
    
    private func getPage(page: Int) {
        Task { @MainActor in
            defer {
                loading = false
            }
            do {
                loading = true
                let response = try await dataProvider.getPage(page: page)
                characters.append(contentsOf: response.results)
                currentPage = page
            } catch {
                print("Error Loading the Page \(page): \(error.localizedDescription)")
            }
        }
    }
}

fileprivate struct PreviewRMCharacterListViewModel: RMCharacterListViewModel {
    var characters: [RMCharacter]
    
    var loading: Bool
    
    init(characters: [RMCharacter], loading: Bool) {
        self.characters = characters
        self.loading = loading
    }
    
    func start() {
        
    }
    
    func appear(characterID: Int) {
        
    }
    
    func characterSelected(character: RMCharacter) {
        
    }
}

extension RMCharacter {
    static var toxicRick: RMCharacter {
        RMCharacter(id: 361,
                    name: "Toxic Rick",
                    status: .dead,
                    species: "Humanoid",
                    type: "Rick's Toxic Side",
                    gender: .male,
                    origin: .init(name: "Alien Spa"),
                    location: .init(name: "Earth"),
                    image: "https://rickandmortyapi.com/api/character/avatar/361.jpeg",
                    episode: [27])
    }
    
    static var johnnyDepp: RMCharacter {
        RMCharacter(id: 183,
                    name: "Johnny Depp",
                    status: .alive,
                    species: "Human",
                    type: "",
                    gender: .male,
                    origin: .init(name: "Earth (C-500A)"),
                    location: .init(name: "Earth (C-500A)"),
                    image: "https://rickandmortyapi.com/api/character/avatar/183.jpeg",
                    episode: [8])
    }
}

#Preview("Full state") {
    RMCharacterListView(viewModel: DefaultRMCharacterListViewModel(dataProvider: RMDataProvider<RMCharacter, RMCharacterConfiguration>(entity: .init(configuration: .init()))))
}

#Preview("Empty State") {

    let viewModel = PreviewRMCharacterListViewModel(characters: [], loading: false)
    
    return RMCharacterListView(viewModel: viewModel)
}

#Preview("Loading Row") {
    let viewModel = PreviewRMCharacterListViewModel(characters: [.toxicRick, .johnnyDepp], loading: true)
    return RMCharacterListView(viewModel: viewModel)
}
