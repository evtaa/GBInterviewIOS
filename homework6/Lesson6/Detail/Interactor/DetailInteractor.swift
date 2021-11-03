import Foundation

final class DetailInteractor {
    
    weak var output: DetailInteractorOutput?
    private let service: ArtistService
    private let artistId: Int
    

    init(artistId: Int, service: ArtistService) {
    self.artistId = artistId
    self.service = service
  }
}

extension DetailInteractor: DetailInteractorInput {

  func obtainDetails() {
    service.fetchArtistList {[weak self] result in
        guard let strongSelf = self else { return }
        switch result {
        case let .success(list):
            if let artist = list.first(where: { (artist) -> Bool in
                artist.identifier == strongSelf.artistId
            }) {
                strongSelf.output?.presentDetails(for: artist)
            }
            
        case .failure(_):
            break
          //  strongSelf.output?.showError(error)
        }
    }
  }
}
