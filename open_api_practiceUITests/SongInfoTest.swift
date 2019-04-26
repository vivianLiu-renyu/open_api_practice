//
//  open_api_practiceUITests.swift
//  open_api_practiceUITests
//
//  Created by Vivian Liu on 2019/1/4.
//  Copyright © 2019 Search_Question_Avengers. All rights reserved.
//

import XCTest

class SongInfoTest: XCTestCase {
    let XCUIAPP = XCUIApplication()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIAPP.launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testOpenNewHitsPlaylists() {
        let playlist = XCUIAPP.tables.cells["New Hits Playlist Cell 0"]
        let HitPlaylistname = playlist.staticTexts.element(boundBy: 0).label
        playlist.tap()
        let NavigationBarsplaylietname = XCUIAPP.navigationBars.otherElements.element(boundBy: 0).label
        XCTAssert(HitPlaylistname == NavigationBarsplaylietname)
    }
    
    func testSonginformation() {
        let playlist = XCUIAPP.tables.cells["New Hits Playlist Cell 0"]
        playlist.tap()
        let Playlistinfo = XCUIAPP.otherElements.element(boundBy: 0).cells
        XCTAssert(Playlistinfo.staticTexts.element(boundBy: 0).label != "")
        XCTAssert(Playlistinfo.staticTexts.element(boundBy: 1).label != "" )
        XCTAssert(Playlistinfo.images.element(boundBy: 0).exists == true )
    }
}
