import UIKit

struct DetailAssembly {

  static func assemble(artistId: Int) -> UIViewController {
    let dataHandler: DetailViewDataHandler = DetailViewDataHandler()
    let artService: ArtistService = ArtistServiceImplementation()
    
    let view = DetailViewController(dataHandler: dataHandler)
    let presenter = DetailPresenter()
    let interactor = DetailInteractor(artistId: artistId, service: artService)
    let router = DetailRouter()

    view.output = presenter
    presenter.view = view
    presenter.interactor = interactor
    presenter.router = router
    interactor.output = presenter

    return view
  }
}
