import XCTest
@testable import Lesson6

final class DetailTests: XCTestCase {
    
    func testViewAssembly() {
        let controller = DetailAssembly.assemble(artistId: 0)
        XCTAssert(controller is DetailViewController)

        let sut = controller as! DetailViewController

        XCTAssertNotNil(sut.dataHandler)
        XCTAssertNotNil(sut.output)
    }
    
    func testPresenterAssembly() {
            let view = DetailAssembly.assemble(artistId: 0)
            let presenter = (view as! DetailViewController).output
            XCTAssert(presenter is DetailPresenter)

            let sut = presenter as! DetailPresenter

            XCTAssertNotNil(sut.interactor)
            XCTAssertNotNil(sut.router)
            XCTAssertNotNil(sut.view)
        }
    
    func testInteractorAssembly() {
            let presenter = (DetailAssembly.assemble(artistId: 0) as! DetailViewController).output
            let interactor = (presenter as! DetailPresenter).interactor
            XCTAssert(interactor is DetailInteractor)

            let sut = interactor as! DetailInteractor
            XCTAssertNotNil(sut.output)
        }
    
    func testRouterAssembly() {
            let view = DetailAssembly.assemble(artistId: 0)
            let presenter = (view as! DetailViewController).output
            let router = (presenter as! DetailPresenter).router

            XCTAssert(router is DetailRouter)

        }

}
