//
//  BookListViewModelTests.swift
//  LOTR AppTests
//
//  Created by Latif Atci on 7/8/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import XCTest
@testable import LOTR_App

class BookListViewModelTests: XCTestCase {

    private var view: MockBookListViewController!
    private var service: MockService!
    private var viewModel: BookListViewModel!
    
    override func setUp() {
        view = MockBookListViewController()
        service = MockService()
        viewModel = BookListViewModel(service)
        viewModel.delegate = view
    }
    
    override func tearDown() {
        view = nil
        service = nil
        viewModel = nil
    }
    
    func testLoading() throws {
        
        //Given
        let book = try ResourceLoader.loadBook()
        service.books = book
        
        //When
        viewModel.loadData()
        
        //Then
        XCTAssertEqual(view.outputs.count, 3)
        
        //TODO
        
    }

}

//Mock View for testing
private class MockBookListViewController: BookListViewModelDelegate {
    
    var outputs: [BookListViewModelOutput] = []
    
    func resetOutputs() {
        outputs.removeAll()
    }
    func handleViewModelOutput(_ output: BookListViewModelOutput) {
        outputs.append(output)
    }
    
    
}
