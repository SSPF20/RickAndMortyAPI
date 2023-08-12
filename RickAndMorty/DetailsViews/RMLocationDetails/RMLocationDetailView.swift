//
//  ContentView.swift
//  SwiftUITry
//
//  Created by Horacio Parra Rodriguez on 2/08/23.
//

import SwiftUI

struct RMLocationDetailView: View {
    
    @ObservedObject var viewModel: RMLocationDetailsViewModel
    
    let columns = [
        GridItem(.flexible(minimum: 100)),
        GridItem(.flexible(minimum: 100))
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                nameValueField(name: "Name:", value: viewModel.name)
                nameValueField(name: "Type:", value: viewModel.type)
                nameValueField(name: "Dimension:", value: viewModel.dimension)
                Rectangle()
                    .frame(width: .infinity, height: 2)
                    .foregroundColor(.red)
                    .padding()
                
                Text(NSLocalizedString("Residents", comment: ""))
                    .font(.title)
                    .bold()
                
                LazyVGrid(columns: columns, content: {
                    ForEach(viewModel.characterIds, id: \.self) { num in
                        CharacterCardView(viewModel: .init(id: num))
                    }
                })
                
                Spacer()
            }
            .padding()
        }
    }
    
    
    @ViewBuilder
    func nameValueField(name: String, value: String) -> some View {
        HStack {
            Text(name)
                .font(.headline)
            Text(value)
                .font(.subheadline)
            Spacer()
        }
        .padding([.leading, .top])
    }
}

struct CharacterCardView: View {
    
    @ObservedObject var viewModel: CharacterCardViewModel
    
    var body: some View {
        switch viewModel.status {
        case .loading:
            ProgressView()
        case .ready:
            readyView
        case .error:
            Text("Error")
        }
    }
    
    @ViewBuilder
    var readyView: some View {
        ZStack(alignment:.bottom) {
            AsyncImage(url: viewModel.url) { phase in
                switch phase {
                case .empty:
                    Image(systemName: "PlaceHolder")
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                case .failure(let error):
                    Text("Error \(String(describing: error))")
                @unknown default:
                    fatalError()
                }
            }
            VStack {
                Spacer()
                Text(viewModel.name)
                    .padding()
                    .foregroundStyle(.background)
                    .font(.headline)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .background(Color.black.opacity(0.4))
            }
        }
        .border(.red)
    }
}

struct CharacterCardView_Previews: PreviewProvider {
    
    static var previews: some View {
        CharacterCardView(viewModel: CharacterCardViewModel(id: 2))
    }
}

class CharacterCardViewModel: ObservableObject {
    
    enum CharacterCardViewModelStatus {
        case loading
        case ready
        case error
    }
    
    var url: URL {
        URL(string: character!.image)!
    }
    
    @Published var status: CharacterCardViewModelStatus = .loading {
        didSet {
            print("GUZMH012 Status for \(id): \(String(describing: status))")
        }
    }
    
    private let id: Int
    private let networkFetcher: NetworkFetcher
    private var character: RMCharacter?
    
    init(id: Int, networkFetcher: NetworkFetcher = DefaultNetworkFetcher()) {
        self.id = id
        self.networkFetcher = networkFetcher
        loadCharacter()
    }
    
    func loadCharacter() {
        Task {
            do {
                let endpoint = RMCharacterEndpoint.characterById(id)
                let character: RMCharacter = try await networkFetcher.fetch(endpoint: endpoint)
                self.character = character
                self.status = .ready
            } catch {
                self.status = .error
            }
        }
    }
    
    var name: String {
        character?.name ?? ""
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let location = RMLocation(id: 1,
                                  name: "Earth",
                                  type: "Planet",
                                  dimension: "Dimension C-137",
                                  residents: [])
        
        let viewModel = RMLocationDetailsViewModel(location: location)
        
        
    }
    
}
