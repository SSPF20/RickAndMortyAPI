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
    
    private var viewModel: EntityListViewModel<RMCharacter, RMCharacterConfiguration>
    private let columns = [GridItem(.flexible(minimum: 100))]
    
    init(viewModel: EntityListViewModel<RMCharacter, RMCharacterConfiguration>) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            if viewModel.elements.isEmpty, !viewModel.loading {
                ContentUnavailableView(label: {
                    Label(NSLocalizedString("No Characters Found", comment: ""), systemImage: "person.fill.xmark")
                }, description: {
                    Text(NSLocalizedString("Something Happened", comment: ""))
                }, actions: {
                    Button(NSLocalizedString("Try again", comment: "")) {
                        viewModel.start()
                    }
                })
            } else {
                LazyVGrid(columns: columns, spacing: 10, content: {
                    ForEach(viewModel.elements, id: \.self) { character in
                        CharacterCardView(viewModel: .init(character: character), action: { viewModel.entitySelected(entity: character) })
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.horizontal)
                            .onAppear(perform: {
                                viewModel.appear(entityID: character.id)
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
        }
        .onAppear(perform: {
            viewModel.start()
        })
    }
}

 
@Observable class EntityListViewModel<T: Decodable & Identifiable, C: UniversalConfiguration> {
    private let dataProvider: RMDataProvider<T,C>
    var elements: [T] = []
    private var currentPage = 0
    var loading = false
    var coordinator: Coordinator?
    
    init(dataProvider: RMDataProvider<T, C>) {
        self.dataProvider = dataProvider
    }
    
    func start() {
        guard elements.isEmpty else {
            return
        }
        getPage(page: 1)
    }
    
    func appear(entityID: T.ID) {
        guard let lastEntityID = elements.last?.id else {
            return
        }
        if entityID == lastEntityID {
            getPage(page: currentPage + 1)
        }
    }
    
    func entitySelected(entity: T) {
        coordinator?.pushEntityDetail(entity: entity)
    }
    
    private func getPage(page: Int) {
        Task { @MainActor in
            defer {
                loading = false
            }
            do {
                loading = true
                let response = try await dataProvider.getPage(page: page)
                elements.append(contentsOf: response.results)
                currentPage = page           
            } catch {
                print("Error Loading the Page \(page): \(error.localizedDescription)")
            }
            
        }
    }
}

// TODO: - Migrate with EntityListViewModel
//fileprivate struct PreviewRMCharacterListViewModel: RMCharacterListViewModel {
//    var characters: [RMCharacter]
//    
//    var loading: Bool
//    
//    init(characters: [RMCharacter], loading: Bool) {
//        self.characters = characters
//        self.loading = loading
//    }
//    
//    func start() {
//        
//    }
//    
//    func appear(characterID: Int) {
//        
//    }
//    
//    func characterSelected(character: RMCharacter) {
//        
//    }
//}

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
    RMCharacterListView(viewModel: .init(dataProvider: .init(entity: .init(configuration: .init()))))
}

//#Preview("Empty State") {
//
//    let viewModel = PreviewRMCharacterListViewModel(characters: [], loading: false)
//    
//    return RMCharacterListView(viewModel: viewModel)
//}
//
//#Preview("Loading Row") {
//    let viewModel = PreviewRMCharacterListViewModel(characters: [.toxicRick, .johnnyDepp], loading: true)
//    return RMCharacterListView(viewModel: viewModel)
//}
