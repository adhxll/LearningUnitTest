//
//  HomeViewModelTests.swift
//  LearningUnitTest
//
//  Created by Adhella Subalie on 03/09/25.
//

import XCTest
@testable import LearningUnitTest

final class HomeViewModelTests: XCTestCase {
    var viewModel: HomeViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = HomeViewModel()
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
    }
    // Write tests here
}


