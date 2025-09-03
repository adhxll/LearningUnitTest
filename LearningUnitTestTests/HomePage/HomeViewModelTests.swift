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
    
    func test_onCakeAppearAgain() throws {
        // GIVEN
        
        // WHEN
        viewModel.onCakeAppearAgain()
        
        // THEN
        XCTAssertEqual(viewModel.tapCount, 0)
        XCTAssertEqual(viewModel.shouldTriggerCakeDissapear, false)
    }
    
    func test_onCakeTapped() throws {
        // GIVEN
        let currentTapCount = viewModel.tapCount
        
        // WHEN
        viewModel.onCakeTapped()
        
        // THEN
        XCTAssertEqual(viewModel.tapCount, currentTapCount + 1)
        XCTAssertEqual(viewModel.shouldTriggerCakeDissapear, false)
    }
    
    func test_onCakeTappedAndShowsBackgroundText() throws {
        // GIVEN
        viewModel.tapCount = 4
        
        // WHEN
        viewModel.onCakeTapped()
        
        // THEN
        XCTAssertEqual(viewModel.tapCount, 5)
        XCTAssertEqual(viewModel.shouldTriggerCakeDissapear, true)
    }
}


