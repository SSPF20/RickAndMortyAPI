//
//  RMLocationListView.swift
//  RickAndMorty
//
//  Created by Simon Parraga on 4/03/24.
//

import SwiftUI

struct RMLocationListView: View {
    private let columns = [GridItem(.flexible(minimum: 100))]
    let viewModel: EntityListViewModel<RMLocation, RMLocationConfiguration>
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10, content: {
                ForEach(viewModel.elements, id: \.self) { location in
                    RMLocationCardView(viewModel: .init(location: location),
                                       action: { viewModel.entitySelected(entity: location)
                    })
                        .onAppear(perform: {
                            viewModel.appear(entityID: location.id)
                        })
                }
                
            })
            .padding(.horizontal)
        }
        .onAppear(perform: {
            viewModel.start()
        })
    }
}

#Preview {
    RMLocationListView(viewModel: .init(dataProvider: .init(entity: .init(configuration: .init()))))
}

extension RMLocation {
    static var birdWorld: RMLocation {
        .init(id: 15,
              name: "Bird World",
              type: "Planet",
              dimension: "Unknown",
              residents: [])
    }
    
    static var planetSquanch: RMLocation {
        .init(id: 35,
              name: "Planet Squanch",
              type: "Planet",
              dimension: "Replacement Dimension",
              residents: [47, 75, 102, 194])
    }
}

//struct ButtonEntity: ButtonStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        if configuration.isPressed {
//            configuration.label
//                .foregroundStyle(.green)
//        }
//    }
//}
//
//extension ButtonStyle where Self == ButtonEntity {
//    static var buttonEntity: Self { Self() }
//}
