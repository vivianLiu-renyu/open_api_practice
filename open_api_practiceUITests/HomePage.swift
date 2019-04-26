import XCTest

class HomePage: Page {
    lazy var navigationTitle = app.navigationBars["Home"].firstMatch
    lazy var newAlbumSectionTitle = app.buttons["new albums section title"].firstMatch
    lazy var newAlbumSection = app.collectionViews["new albums section"].firstMatch
    lazy var newAlbumCells = app.collectionViews["new albums section"].cells
    
    required init(_ app: XCUIApplication) {
        super.init(app)
        expect(element: navigationTitle, status: .exist)
    }
    
    @discardableResult
    func checkNewAlbumsHas(number count: Int) -> Self {
        let newAlbumCell = newAlbumCells["New Album Cell \(count - 1)"].firstMatch
        expect(element: newAlbumCell, status: .exist)
        
        return self
    }
    
    @discardableResult
    func swipeLeftToNewAlbum(at position: Int) -> Self {
        let newAlbumCell = newAlbumCells["New Album Cell \(position)"].firstMatch
        while !newAlbumCell.exists || !newAlbumCell.isHittable {
            swipeLeft(element: newAlbumSection)
        }
        
        return self
    }
    
    @discardableResult
    func openNewAlbums() -> NewAlbumsPage {
        tap(element: newAlbumSectionTitle)
        
        return NewAlbumsPage(app)
    }
}
