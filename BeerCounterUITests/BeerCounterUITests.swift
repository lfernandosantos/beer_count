//
//  BeerCounterUITests.swift
//  BeerCounterUITests
//
//  Created by Fernando on 30/05/19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import XCTest

class BeerCounterUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        
        let app = XCUIApplication()
        app.buttons["Add Beers"].tap()
        app.alerts.buttons["Confirm"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["[29] 18 : 40  - 1"]/*[[".cells.staticTexts[\"[29] 18 : 40  - 1\"]",".staticTexts[\"[29] 18 : 40  - 1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let tab = app.tables
        print(app.tables.count)
        
    }

}
