//
//  open_api_practiceUITests.swift
//  open_api_practiceUITests
//
//  Created by Vivian Liu on 2019/1/4.
//  Copyright © 2019 Search_Question_Avengers. All rights reserved.
//

import XCTest

class open_api_practiceUITests: XCTestCase {

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

    func testNewHitsPlaylistsHaveTwenty() {
        let playlists = XCUIApplication().tables.cells.matching(identifier: "new_hits_playlist")
        XCTAssert(playlists.count == 20)
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testNewHitsPlaylistsHavePlaylistName() {
        let playlistname = XCUIApplication().tables.cells.matching(identifier: "new_hits_playlist")
        XCTAssert(playlistname.element(boundBy: 0).staticTexts.matching(identifier: "playlist_name").element(boundBy: 0).label != "" )
    }
    
    func testNewHitsPlaylistsHaveCuratorName() {
        let playlistname = XCUIApplication().tables.cells.matching(identifier: "new_hits_playlist")
        XCTAssert(playlistname.element(boundBy: 0).staticTexts.matching(identifier: "curator_name").element(boundBy: 0).label != "" )
    }
    
    func testNewHitsPlaylistsHavePlaylistCover() {
        let playlistname = XCUIApplication().tables.cells.matching(identifier: "new_hits_playlist")
        XCTAssert(playlistname.element(boundBy: 0).images.matching(identifier: "playlist_cover").element(boundBy: 0).exists == true )
    }
}
