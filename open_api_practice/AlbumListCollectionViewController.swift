import UIKit
import KKBOXOpenAPISwift

class AlbumListCollectionViewController: UICollectionViewController {
    var newAlbumsList: AlbumsAPIData = AlbumsAPIData()
    var newAlbumData: [AlbumData] = []
    var isWating = false
    var pageNumber = 0
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        
        DispatchQueue.global().async {
            self.newAlbumsList = GetNewAlbumsData.initNewAlbumsData(self.newAlbumsList, offset: self.pageNumber * 50)
            
            DispatchQueue.main.async {
                if let albumDat = self.newAlbumsList.albumsArray {
                    self.newAlbumData = albumDat
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newAlbumData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "album", for: indexPath) as! AlbumCollectionViewCell
        let albumDat = self.newAlbumData[indexPath.row]
        
        cell.albumName.text = albumDat.albumName
        cell.albumImage.clipsToBounds = true
        cell.accessibilityIdentifier = "New Album Cell \(indexPath.row)"
        
        let albumImageAddress = albumDat.albumImageUrl
        if let imageUrl = URL(string: albumImageAddress) {
            DispatchQueue.global().async {
                do{
                    let imageData = try Data(contentsOf: imageUrl)
                    let downloadedImage = UIImage(data: imageData)
                    DispatchQueue.main.async {
                        cell.albumImage.image = downloadedImage
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        
        cell.albumImage.layer.cornerRadius = 5
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == newAlbumData.count - 1 {
            isWating = true
            pageNumber += 1
            print("Page Number: ",pageNumber)
            doPaging()
        }
    }
    
    private func doPaging() {
        var nextNewAlbumsList: AlbumsAPIData = AlbumsAPIData()
        
        DispatchQueue.global().async {
            nextNewAlbumsList = GetNewAlbumsData.initNewAlbumsData(nextNewAlbumsList, offset: self.pageNumber * 50)
            
            DispatchQueue.main.async {
                if let nextNewAlbumData = nextNewAlbumsList.albumsArray {
                    for i in 0..<nextNewAlbumData.count {
                        self.newAlbumData.append(nextNewAlbumData[i])
                    }
                    self.collectionView.reloadData()
                    self.isWating = false
                }
            }
        }
    }
}
