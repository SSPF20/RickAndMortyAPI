//
//  RMListViewModel.swift
//  RickAndMorty
//
//  Created by Horacio Guzman on 11/06/23.
//

import Foundation
import UIKit
import Combine

@MainActor
final class RMListViewModel<A: Decodable, B: Configuration> {
    
    enum RMListViewModelAction {
        case setSnapshot(RMListSnapshot)
    }
    
    private var elements: [[A]] = [] {
        didSet {
            createSnapshot()
        }
    }
    private var currentInfo: RMResponse<A>.RMResponseInfo?
    
    private let dataProvider: RMDataProvider<A, B>
    
    var RMListViewModelActionPublisher: AnyPublisher<RMListViewModelAction, Never> {
        RMListViewModelActionSubject.eraseToAnyPublisher()
    }
    private var RMListViewModelActionSubject = PassthroughSubject<RMListViewModelAction, Never>()
    
    var cellType: UICollectionViewCell.Type {
        dataProvider.entity.configuration.cellHorizontalType
    }
    
    var reuseID: String {
        dataProvider.entity.configuration.reuseID
    }
    
    var estimatedHeightForItem: CGFloat {
        dataProvider.entity.configuration.estimatedHeightForItem
    }
    
    nonisolated init(dataProvider: RMDataProvider<A, B>) {
        self.dataProvider = dataProvider
    }
    
    func start() {
        loadPage(page: 1)
    }
    
    func loadNextPage() {
        guard let nextPage = currentInfo?.next?.urlID else {
            return
        }
        
        loadPage(page: nextPage)
    }
    
    private func loadPage(page: Int) {
        Task {
            do {
                let response = try await dataProvider.getPage(page: page)
                elements.append(response.results)
                currentInfo = response.info
                
            } catch {
                print("LoadPage error \(String(describing: error))")
            }
        }
    }
    
    private func createSnapshot() {
        
        var snapshot = RMListSnapshot()
        var sections = [Int]()
        for i in 0..<elements.count {
            sections.append(i)
        }
        snapshot.appendSections(sections)
        
        for i in sections {
            let viewModels = elements[i].compactMap { dataProvider.entity.configuration.getCellViewModelForEntity(entity: $0) }
            snapshot.appendItems(viewModels, toSection: i)
        }
        RMListViewModelActionSubject.send(.setSnapshot(snapshot))
    }
    
}
