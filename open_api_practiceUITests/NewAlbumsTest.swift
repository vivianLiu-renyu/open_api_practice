import XCTest

class NewAlbumsTest: XCTestCase {
    var myApp: Page!
    var app: XCUIApplication!
    
    override func setUp() {
        self.app = XCUIApplication()
        self.continueAfterFailure = false
    }
    
    func testOpenNewAlbumList() {
        myApp = TestBuilder(app).launch()
        
        myApp.on(view: HomePage.self).openNewAlbums()
             .on(view: NewAlbumsPage.self)
    }
    
    func testWillAppearAlbumCoverAndAlbumName() {
        myApp = TestBuilder(app).launch()
        
        myApp.on(view: HomePage.self).openNewAlbums()
             .on(view: NewAlbumsPage.self).checkAppearAlbumName(at: 0)
             .on(view: NewAlbumsPage.self).checkAppearAlbumCover(at: 0)
    }
    
    func testCanLoadMoreSixHundredAlbums() {
        myApp = TestBuilder(app).launch()
        
        myApp.on(view: HomePage.self).openNewAlbums()
             .on(view: NewAlbumsPage.self).checkLoadMoreToAlbum(number: 600)
    }
}
