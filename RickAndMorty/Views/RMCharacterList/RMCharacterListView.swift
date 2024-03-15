//
//  SomeRandomView.swift
//  RickAndMorty
//
//  Created by Horacio Guzman on 23/02/24.
//

import SwiftUI
import SDWebImageSwiftUI
import Observation

struct RMCharacterListView: View, NavigationBarHandler {
    
    private var viewModel: EntityListViewModel<RMCharacter, RMCharacterConfiguration>
    private let columns = [GridItem(.flexible(minimum: 100))]
    private let columnsForGrid = [GridItem(.flexible(minimum: UIScreen.main.bounds.width * 0.5)),
                                  GridItem(.flexible(minimum: UIScreen.main.bounds.width * 0.5))]
    
    init(viewModel: EntityListViewModel<RMCharacter, RMCharacterConfiguration>) {
        self.viewModel = viewModel
        viewModel.configureRightButtonForToggleList()
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
                if viewModel.isListShowed {
                    LazyVGrid(columns: columns, spacing: 10, content: {
                        ForEach(viewModel.elements, id: \.self) { character in
                            cardInRow(viewModel: .init(character: character), action: {viewModel.entitySelected(entity: character)})
                                .padding(.horizontal)
                                .onAppear(perform: {
                                    viewModel.appear(entityID: character.id)
                                })
                        }
                        
                    })
                } else {
                    LazyVGrid(columns: columnsForGrid, spacing: 20, content: {
                        ForEach(viewModel.elements, id: \.self) { character in
                            cardInGrid(viewModel: .init(character: character), action: {viewModel.entitySelected(entity: character)})
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(.horizontal)
                                .onAppear(perform: {
                                    viewModel.appear(entityID: character.id)
                                })
                        }
                    })
                }
                
                if viewModel.loading {
                    ProgressView {
                        Text(NSLocalizedString("Loading", comment: ""))
                    }
                    .font(.title)
                    .padding()
                }
            }
        }
        .onAppear(perform: {
            viewModel.start()
        })
    }
    
    func getUIBarButtonItem() -> UIBarButtonItem {
        viewModel.rightBarButtonItem ?? UIBarButtonItem()
    }
    
    @ViewBuilder
    private func cardInRow(viewModel: CharacterCardViewModel, action: @escaping () -> ()) -> some View {
        Button(action: action, label: {
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
    private func cardInGrid(viewModel: CharacterCardViewModel, action: @escaping () -> ()) -> some View {
        Button {
            action()
        } label: {
            ZStack(alignment: .top) {
                ZStack(alignment: .bottom) {
                    WebImage(url: viewModel.imageURL)
                        .resizable()
                        .scaledToFit()
                    ZStack(alignment: .bottom) {
                        Text(viewModel.name ?? "")
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                            .bold()
                            .foregroundStyle(.primary)
                            .background(
                            RoundedRectangle(cornerSize: CGSize(width: 0, height: 0))
                                .foregroundStyle(.thinMaterial)
                                .frame(width: 200)
                            )
                    }
                }
                HStack {
                    Spacer()
                    statusFlagView(statusColor: viewModel.status)
                }
                
            }
        }
        .clipShape(.rect(cornerRadius: 10))
        .foregroundStyle(.primary)
        
    }
    
    @ViewBuilder
    private func statusFlagView(statusColor: RMCharacter.Status) -> some View {
        RoundedRectangle(cornerRadius: 0)
            .foregroundStyle(statusColor.color)
            .frame(width: 15, height: 40)
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
