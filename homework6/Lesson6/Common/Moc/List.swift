//
//  ListViewMoc.swift
//  Lesson6
//
//  Created by Alexandr Evtodiy on 03.11.2021.
//  Copyright © 2021 Alex Apriamashvili. All rights reserved.
//

import Foundation
import UIKit

// MARK: - ListRouterMock
final class ListRouterMock: ListRouterInput {
    var invocations: [Invocations] = []
    func goToDetails(artist id: Int) {
        invocations.append(.goToDetails(id: id))
    }
}

extension ListRouterMock {
    enum Invocations {
        case goToDetails(id: Int)
        case otherAction
    }
}

// MARK: - ListInteractorMock
final class ListInteractorMock: ListInteractorInput {
    var invocations: [Invocations] = []
    func obtainArtists() {
        invocations.append(.obtainArtists)
    }
    
    func obtainArtist(at index: Int) -> Model.Artist? {
        invocations.append(.obtainArtist(index: index))
        let artist = ModelStubFactory.detail()
        return artist
    }
}
extension ListInteractorMock {
    enum Invocations: Equatable {
        case obtainArtists
        case obtainArtist(index: Int)
        case otherAction
    }
}

 // MARK: - ListViewMock
final class ListViewMock: ListViewInput {
    var invocations: [Invocations] = []
    func reload(_ viewModels: [ListViewModel]) {
        invocations.append(.reload(viewModels: viewModels))
    }
}
extension ListViewMock {
    enum Invocations {
        case reload (viewModels: [ListViewModel] )
        case otherAction
    }
}

