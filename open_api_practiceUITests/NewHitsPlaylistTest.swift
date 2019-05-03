import XCTest

class NewHitsPlaylistTest: XCTestCase {
    let XCUIAPP = XCUIApplication()

    override func setUp() {
        continueAfterFailure = false
        XCUIAPP.launch()
    }

    func testNewHitsPlaylistsHaveTwenty() {
        let playlists = XCUIAPP.tables.cells.matching(NSPredicate(format: "identifier BEGINSWITH %@", "New Hits Playlist Cell"))
        XCTAssert(playlists.count == 20)
    }
    
    func testNewHitsPlaylistsHavePlaylistinformation() {
        let playlistName = XCUIAPP.tables.cells.matching(NSPredicate(format: "identifier BEGINSWITH %@", "New Hits Playlist Cell"))
        XCTAssert(playlistName.element(boundBy: 0).staticTexts.matching(identifier: "playlist_name").element(boundBy: 0).label != "" )
        XCTAssert(playlistName.element(boundBy: 0).staticTexts.matching(identifier: "curator_name").element(boundBy: 0).label != "" )
        XCTAssert(playlistName.element(boundBy: 0).images.matching(identifier: "playlist_cover").element(boundBy: 0).exists == true )
    }
}
