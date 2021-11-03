//
//  ListPresenter.swift
//  Lesson6
//
//  Created by Alexandr Evtodiy on 02.11.2021.
//  Copyright © 2021 Alex Apriamashvili. All rights reserved.
//

import Foundation
import UIKit

final class ListPresenter: NSObject {

    weak var view: ListViewInput?
    var router: ListRouterInput?
    var interactor: ListInteractorInput?
}

extension ListPresenter: ListViewOutput {

    func viewIsReady() {
        interactor?.obtainArtists()
    }
}

extension ListPresenter: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let artistId = interactor?.obtainArtist(at: indexPath.row)?.identifier else { return }
        router?.goToDetails(artist: artistId)
    }
}

extension ListPresenter: ListInteractorOutput {

    func showResults(_ results: [Model.Artist]) {
        view?.reload(
            results.map{ ListViewModel(title: $0.name) }
        )
    }
}

