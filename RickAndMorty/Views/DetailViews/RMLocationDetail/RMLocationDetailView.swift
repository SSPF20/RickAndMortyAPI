//
//  RMLocationDetailView.swift
//  RickAndMorty
//
//  Created by Horacio Parra Rodriguez on 1/09/23.
//

import SwiftUI

struct RMLocationDetailView: View {
    var colums = [GridItem(.flexible(minimum: 80)),
                  GridItem(.flexible(minimum: 80)),
                  GridItem(.flexible(minimum: 80))]
    
    var viewModel: RMLocationDetailViewModel
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                NameValueField(name: "Name: ", value: viewModel.name, font: .title2)
                NameValueField(name: "Type: ", value: viewModel.type, font: .title2)
                NameValueField(name: "Dimension: ", value: viewModel.dimension, font: .title2)
                Spacer()
            }
            .padding([.leading, .top])
            VStack {
                Rectangle()
                    .frame(width: 320, height: 5)
                    .padding()
                Text(NSLocalizedString("Characters", comment: ""))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    Spacer(minLength: 10)
                LazyVGrid(columns: colums, content: {
                    ForEach(viewModel.residentsId, id: \.self) { id in
                        RMCharacterCardView(viewModel: .init(id: id))
                        // TODO: When we merge, we need to use this card in the episodeDetail
                    }
                    .padding([.leading, .trailing], 8)
                })
            }
        }
        
    }
    
    @ViewBuilder
    func NameValueField(name: String, value: String, font: Font) -> some View {
        HStack(alignment: .top) {
            Text(name)
                .font(font)
                .bold()
            Text(value)
                .font(font)
            Spacer()
        }
        .padding(.top, 1)
    }
}

#Preview {
    RMLocationDetailView(viewModel: .init(location: .init(id: 1,
                                                          name: "Earth",
                                                          type: "Planet",
                                                          dimension: "Dimension C-137",
                                                          residents: [])))
}
