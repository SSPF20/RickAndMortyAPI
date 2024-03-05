//
//  RMLocationCardView.swift
//  RickAndMorty
//
//  Created by Simon Parraga on 4/03/24.
//

import SwiftUI

struct RMLocationCardView: View {
    let viewModel: RMLocationCardViewModel
    let action: () -> ()
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                    .foregroundStyle(.quinary)
                VStack {
                    Text(viewModel.name ?? "")
                        .multilineTextAlignment(.center)
                        .font(.title2)
                        .bold()
                    HStack {
                        Spacer()
                        Text(viewModel.type ?? "")
                            .font(.headline)
                    }
                }
                .padding()
            }
        }
        .foregroundStyle(.primary)
    }
}

@Observable
final class RMLocationCardViewModel {
    
    private let location : RMLocation
    
    init(location: RMLocation) {
        self.location = location
    }
    
    var name: String? {
        location.name
    }
    
    var type: String? {
        location.type
    }
}

#Preview {
    RMLocationCardView(viewModel: .init(location: .birdWorld), action: {})
}
