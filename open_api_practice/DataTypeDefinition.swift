import Foundation
import KKBOXOpenAPISwift

class PlaylistsAPIData {
    var playlistArray: [PlaylistData]? = nil
}

class SongTracksAPIData {
    var songTracksArray: [SongTrackData]? = nil
}

class AlbumsAPIData {
    var albumsArray: [AlbumData]? = nil
}

class AlbumData {
    var albumName = ""
    var albumImageUrl = ""
    var albumID = ""
    
    init() {
        albumName = ""
        albumImageUrl = ""
        albumID = ""
    }
    
    init(name: String, url: String, id : String) {
        albumName = name
        albumImageUrl = url
        albumID = id
    }
}

class PlaylistData {
    var playlistName = ""
    var playlistImageUrl = ""
    var playlistURL = ""
    var playlistID = ""
    var curatorName = ""
    var curatorImageUrl = ""
    
    init() {
        playlistName = ""
        playlistImageUrl = ""
        playlistURL = ""
        playlistID = ""
        curatorName = ""
        curatorImageUrl = ""
    }
}

class SongTrackData {
    var songName = ""
    var artistName = ""
    var songCoverURL = ""
    var releaseDate = ""
    
    init() {
        songName = ""
        artistName = ""
        songCoverURL = ""
        releaseDate = ""
    }
}

func getPlaylists(territory: KKTerritory) -> [KKPlaylistInfo] {
    let playlistInfo = DataAPI().getNewHitsPlaylist(territory: territory)

    return playlistInfo
}

func setPlaylistsInfo(as info: KKPlaylistInfo) -> PlaylistData {
    let playlistData = PlaylistData()

    playlistData.playlistName = info.title
    playlistData.playlistID = info.ID
    playlistData.playlistImageUrl = ((info.images[2].url)?.absoluteString)!
    
    let owner = info.owner
    playlistData.curatorName = owner.name
    playlistData.curatorImageUrl = ((owner.images[2].url)?.absoluteString)!
    
    return playlistData
}

func getSongTrackInPlaylist(playlistID: String, territory: KKTerritory) -> KKTrackList {
    let songTrackList = DataAPI().getPlaylistMore(playlistID: playlistID, territory: territory)
    
    return songTrackList
}

func setSongTrackInfo(as info: KKTrackInfo) -> SongTrackData {
    let songTrackData = SongTrackData()
    
    songTrackData.songName = info.name
    songTrackData.artistName = (info.album?.artist?.name)!
    songTrackData.songCoverURL = ((info.album?.images[2].url)?.absoluteString)!
    songTrackData.releaseDate = (info.album?.releaseDate)!
    
    return songTrackData
}

func getNewAlbums(territory: KKTerritory, offset: Int, limit: Int) -> [String: AnyObject] {
    let newAlbumsList = DataAPI().getNewAlbums(territory: territory, offset: offset, limit: limit)
    
    return newAlbumsList
}

func setAlbumsInfo(as info: [String: AnyObject]) -> AlbumData {
    let albumData = AlbumData()
    
    albumData.albumID = info["id"] as? String ?? ""
    albumData.albumName = info["name"] as? String ?? ""
    
    let images = info["images"] as? Array ?? []
    let image = images[2] as? [String:AnyObject] ?? ["" : "" as AnyObject]
    albumData.albumImageUrl = image["url"] as? String ?? ""
    
    return albumData
}
