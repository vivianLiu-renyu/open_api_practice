import XCTest

class HomePage: Page {
    lazy var navigationTitle = app.navigationBars["Home"].firstMatch
    lazy var newAlbumSectionTitle = app.buttons["new albums section title"].firstMatch
    
    required init(_ app: XCUIApplication) {
        super.init(app)
        expect(element: navigationTitle, status: .exist)
    }
    
    func openNewAlbums() -> NewAlbumsPage {
        tap(element: newAlbumSectionTitle)
        
        return NewAlbumsPage(app)
    }
}
