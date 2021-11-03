//
//  ListAssembly.swift
//  Lesson6
//
//  Created by Alexandr Evtodiy on 02.11.2021.
//  Copyright © 2021 Alex Apriamashvili. All rights reserved.
//

import Foundation
import UIKit

struct ListAssembly {

  static func assemble() -> UIViewController {
    
    let dataHandler: ListViewDataHandlerProtocol = ListViewDataHandler()
    let artService: ArtistService = ArtistServiceImplementation()
    
    let view = ListViewController(dataHandler: dataHandler)
    let presenter = ListPresenter()
    let interactor = ListInteractor(service: artService)
    let router = ListRouter()
    
    view.output = presenter
    presenter.view = view
    presenter.router = router
    presenter.interactor = interactor
    interactor.output = presenter
    router.view = view
    
    return view
  }
}
