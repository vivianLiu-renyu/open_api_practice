import XCTest

class NewAlbumsPage: Page {
    lazy var navigationTitle = app.navigationBars["最新專輯"].firstMatch
    lazy var newAlbumsCells = app.cells
    
    required init(_ app: XCUIApplication) {
        super.init(app)
        expect(element: navigationTitle, status: .exist)
    }
    
    func checkLoadMoreToAlbum(number position: Int) -> Self {
        let newAlbumCell = newAlbumsCells["New Album Cell \(position - 1)"].firstMatch
        
        while !newAlbumCell.exists {
            app.windows.firstMatch.swipeUp()
        }
        
        return self
    }
    
    func checkAppearAlbumCover(at position: Int) -> Self {
        let albumCover = newAlbumsCells["New Album Cell \(position)"].images["album_cover"].firstMatch
        expect(element: albumCover, status: .exist)
        
        return self
    }
    
    func checkAppearAlbumName(at position: Int) -> Self {
        let albumName = newAlbumsCells["New Album Cell \(position)"].staticTexts.matching(NSPredicate(format: "identifier == %@ AND label != ''", "album_name")).firstMatch
        expect(element: albumName, status: .exist)
        return self
    }
}
