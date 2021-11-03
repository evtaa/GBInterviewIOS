//
//  Detail.swift
//  Lesson6
//
//  Created by Alexandr Evtodiy on 03.11.2021.
//  Copyright © 2021 Alex Apriamashvili. All rights reserved.
//

import Foundation
import UIKit

// MARK: - DeatailRouterMock
final class DetailRouterMock: DetailRouterInput {
   
}

// MARK: - ListInteractorMock
final class DetailInteractorMock: DetailInteractorInput {
    var invocations: [Invocations] = []
    func obtainDetails() {
        invocations.append(.obtainDetails)
    }
}
extension DetailInteractorMock {
    enum Invocations: Equatable {
        case obtainDetails
        case otherAction
    }
}

 // MARK: - ListViewMock
final class DetailViewMock: DetailViewInput {
    var invocations: [Invocations] = []
    func updateDetails(_ details: DetailViewModel) {
        invocations.append(.updateDetails(details: details))
    }
}
extension DetailViewMock {
    enum Invocations {
        case updateDetails(details: DetailViewModel)
        case otherAction
    }
}
