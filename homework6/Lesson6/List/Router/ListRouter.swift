//
//  ListRouter.swift
//  Lesson6
//
//  Created by Alexandr Evtodiy on 02.11.2021.
//  Copyright © 2021 Alex Apriamashvili. All rights reserved.
//

import Foundation
import UIKit

final class ListRouter {

    weak var view: UIViewController?
}

extension ListRouter: ListRouterInput {

    func goToDetails(artist id: Int) {
        let details = DetailAssembly.assemble(artistId: id)
        view?.navigationController?.pushViewController(details, animated: true)
    }
}

