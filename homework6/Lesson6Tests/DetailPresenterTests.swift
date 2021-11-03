import XCTest
@testable import Lesson6

final class DetailPresenterTests: XCTestCase {
    
    var sut: DetailPresenter!
    var view: DetailViewMock!
    var interactor: DetailInteractorMock!
    var router: DetailRouterMock!

  override func setUp() {
    super.setUp()
    
    router = DetailRouterMock()
    interactor = DetailInteractorMock()
    view = DetailViewMock()
    
    sut = DetailPresenter()
    sut.router = router
    sut.interactor = interactor
    sut.view = view
  }

  override func tearDown() {
    router = nil
    interactor = nil
    view = nil
    sut = nil
    
    super.tearDown()
  }

  func testViewIsReady() {
    sut.viewIsReady()
    guard case DetailInteractorMock.Invocations.obtainDetails = interactor.invocations.first! else {
        XCTFail("expected .obtainDetails, got \(interactor.invocations.first!)")
        return
    }
  }
    
    func testPresentDetails() {
        let artist = ModelStubFactory.detail()
        sut.presentDetails(for: artist)
        
        guard case DetailViewMock.Invocations.updateDetails(details: _) = view.invocations.first! else {
            XCTFail("excepted ")
            return
        }
    }
}
