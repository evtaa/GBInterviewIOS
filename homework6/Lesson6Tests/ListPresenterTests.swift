//
//  ListPresenterTests.swift
//  Lesson6Tests
//
//  Created by Alexandr Evtodiy on 03.11.2021.
//  Copyright © 2021 Alex Apriamashvili. All rights reserved.
//

import XCTest
@testable import Lesson6
import Foundation

final class ListPresenterTests: XCTestCase {
    
    var sut: ListPresenter!
    var view: ListViewMock!
    var interactor: ListInteractorMock!
    var router: ListRouterMock!
    
    override func setUp() {
        super.setUp()
        
        router = ListRouterMock()
        interactor = ListInteractorMock()
        view = ListViewMock()
        
        sut = ListPresenter()
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
        guard case .obtainArtists = interactor.invocations.first! else {
            XCTFail("expected .obtainArtists, got \(interactor.invocations.first!)")
            return
        }
//        guard let first = interactor.invocations.first,
//              first == ListInteractorMock.Invocations.obtainArtists else {
//            XCTFail("expected .obtainArtists, got \(interactor.invocations.first!)")
//            return
//        }
    }
    
    func testShowResults() {
        let service: ArtistService = ArtistServiceImplementation()
        var artists: [Model.Artist] = []
        service.fetchArtistList { (result) in
            switch result {
            case .success(let arrayArtists):
                artists = arrayArtists
            case .failure( _):
            break
            }
        }
        sut.showResults(artists)
        
        guard case let .reload(viewModels: viewModels) = view.invocations.first! else {
            XCTFail("expected .reload(viewModels:), got \(view.invocations.first!)")
            return
        }
        XCTAssertEqual(viewModels.count, 2)
    }
    
    func testUserSelection() {
        let tableView = UITableView()
        let indexPath = IndexPath(row: 0, section: 0)
        sut.tableView(tableView, didSelectRowAt: indexPath)
        
        guard case let .obtainArtist(index: index) = interactor.invocations.first! else {
            XCTFail("expected .obtainArtist(index:), got \(interactor.invocations.first!)")
            return
        }
        XCTAssertEqual(0, index)
        
        guard case let .goToDetails(id: id) = router.invocations.first! else {
                    XCTFail("expected .gotoDetails(artistId:), got \(router.invocations.first!)")
                    return
                }

        XCTAssertEqual(1, id)
    }
}
