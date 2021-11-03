import Foundation
import UIKit

// MARK: - Module I/O

public protocol DetailModuleInput {}

public protocol DetailModuleOutput {}

// MARK: - Module Components

protocol DetailViewInput: class {

  func updateDetails(_ details: DetailViewModel)
}

protocol DetailViewOutput {

  func viewIsReady()
}

protocol DetailInteractorInput {

  func obtainDetails()
}

protocol DetailInteractorOutput: class {

    func presentDetails(for artist: Model.Artist)
}

protocol DetailRouterInput {}
protocol DetailRouterOutput: class {}
