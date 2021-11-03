//
//  List.swift
//  Lesson6
//
//  Created by Alexandr Evtodiy on 02.11.2021.
//  Copyright © 2021 Alex Apriamashvili. All rights reserved.
//

import Foundation
import UIKit

protocol ListViewInput: class {

    func reload(_ viewModels: [ListViewModel])
}

protocol ListViewOutput: UITableViewDelegate {

    func viewIsReady()
}

protocol ListInteractorInput {

    func obtainArtists()
    func obtainArtist(at index: Int) -> Model.Artist?
}
protocol ListInteractorOutput: class {

    func showResults(_ results: [Model.Artist])
}

protocol ListRouterInput {

    func goToDetails(artist id: Int)
}

protocol ListRouterOutput {

    func readyGoToDetails(artist id: Int)
}
