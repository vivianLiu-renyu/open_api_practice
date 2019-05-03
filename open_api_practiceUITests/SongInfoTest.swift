import XCTest

class SongInfoTest: XCTestCase {
    let XCUIAPP = XCUIApplication()
    
    override func setUp() {
        continueAfterFailure = false
        XCUIAPP.launch()
    }
    
    func testOpenNewHitsPlaylists() {
        let playlist = XCUIAPP.tables.cells["New Hits Playlist Cell 0"]
        let hitPlaylistName = playlist.staticTexts.element(boundBy: 0).label
        playlist.tap()
        let navigationBarsPlaylistName = XCUIAPP.navigationBars.otherElements.element(boundBy: 0).label
        XCTAssert(hitPlaylistName == navigationBarsPlaylistName)
    }
    
    func testSongInformation() {
        let playlist = XCUIAPP.tables.cells["New Hits Playlist Cell 0"]
        playlist.tap()
        let playlistInfo = XCUIAPP.otherElements.element(boundBy: 0).cells
        XCTAssert(playlistInfo.staticTexts.element(boundBy: 0).label != "")
        XCTAssert(playlistInfo.staticTexts.element(boundBy: 1).label != "" )
        XCTAssert(playlistInfo.images.element(boundBy: 0).exists == true )
    }
}
