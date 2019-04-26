import XCTest

class NewAlbumsTest: XCTestCase {
    var myApp: Page!
    var app: XCUIApplication!
    
    override func setUp() {
        self.app = XCUIApplication()
        self.continueAfterFailure = false
    }
    
    func testCanSwipeLeftNewAlbumsSection() {
        myApp = TestBuilder(app).launch()
        
        myApp.on(view: HomePage.self).swipeLeftToNewAlbum(at: 9)
             .on(view: HomePage.self).checkNewAlbumsHas(number: 10)
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
    
    func testCanLoadMoreNewAlbum() {
        myApp = TestBuilder(app).launch()
        
        let albumName = myApp
            .on(view: HomePage.self).openNewAlbums()
            .on(view: NewAlbumsPage.self).getAlbumName(at: 0)
        
        myApp.on(view: NewAlbumsPage.self).scrollToAlbum(at: 50)
             .on(view: NewAlbumsPage.self).checkAlbumName(at: 50, name: albumName, status: false)
    }
}
