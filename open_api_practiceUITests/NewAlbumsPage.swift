import XCTest

class NewAlbumsPage: Page {
    lazy var navigationTitle = app.navigationBars["最新專輯"].firstMatch
    lazy var newAlbumsCells = app.cells
    
    required init(_ app: XCUIApplication) {
        super.init(app)
        expect(element: navigationTitle, status: .exist)
    }
    
    @discardableResult
    func checkAlbumName(at position: Int, name: String, status: Bool) -> Self {
        let albumCell = newAlbumsCells.matching(NSPredicate(format: "identifier == %@ AND label == %@", "New Album Cell \(position)", name)).firstMatch
        
        switch status {
        case true:
            expect(element: albumCell, status: .exist)
        case false:
            expect(element: albumCell, status: .notExist)
        }
        
        return self
    }
    
    @discardableResult
    func checkAppearAlbumCover(at position: Int) -> Self {
        let albumCover = newAlbumsCells["New Album Cell \(position)"].images["album_cover"].firstMatch
        expect(element: albumCover, status: .exist)
        
        return self
    }
    
    @discardableResult
    func checkAppearAlbumName(at position: Int) -> Self {
        let albumName = newAlbumsCells["New Album Cell \(position)"].staticTexts.matching(NSPredicate(format: "identifier == %@ AND label != ''", "album_name")).firstMatch
        expect(element: albumName, status: .exist)
        return self
    }
    
    @discardableResult
    func checkLoadMoreToAlbum(number count: Int) -> Self {
        let newAlbumCell = newAlbumsCells["New Album Cell \(count - 1)"].firstMatch
        
        while !newAlbumCell.exists || !newAlbumCell.isHittable {
            swipeUpScreen()
        }
        
        return self
    }
    
    @discardableResult
    func getAlbumName(at position: Int) -> String {
        let newAlbumName = newAlbumsCells["New Album Cell \(position)"].staticTexts["album_name"].firstMatch
        
        return newAlbumName.label
    }
    
    @discardableResult
    func scrollToAlbum(at position: Int) -> Self {
        let newAlbumCell = newAlbumsCells["New Album Cell \(position)"].firstMatch
        scrollToElement(newAlbumCell)
        
        return self
    }
}
