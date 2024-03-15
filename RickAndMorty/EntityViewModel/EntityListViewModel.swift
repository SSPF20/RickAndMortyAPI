//
//  EntityViewModel.swift
//  RickAndMorty
//
//  Created by Horacio Guzman on 11/03/24.
//

import UIKit

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
    
    // MARK: - Toggle List and grid
    
    var rightBarButtonItem: UIBarButtonItem?
    var isListShowed = true
    
    func configureRightButtonForToggleList() {
        self.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.grid.3x1.below.line.grid.1x2"),
                                                  style: .plain,
                                                  target: self,
                                                  action: #selector(toggleButton))
        self.rightBarButtonItem?.tintColor = .systemGreen
    }
    
    @objc func toggleButton() {
        isListShowed.toggle()
        if isListShowed {
            self.rightBarButtonItem?.setSymbolImage(UIImage(systemName: "square.grid.3x1.below.line.grid.1x2")!, contentTransition: .automatic)
        } else {
            self.rightBarButtonItem?.setSymbolImage(UIImage(systemName: "rectangle.grid.1x2")!, contentTransition: .automatic)
        }
    }
    
}
