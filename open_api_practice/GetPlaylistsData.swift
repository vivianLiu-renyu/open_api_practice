import Foundation
import KKBOXOpenAPISwift

class GetPlaylistsData: NSObject {
    static func initNewHitsPlaylistData(_ allPlaylists: PlaylistsAPIData) -> PlaylistsAPIData {
        var playlistList: [KKTerritory:[KKPlaylistInfo]] = [:]
        
        allPlaylists.playlistArray = []

        playlistList[.taiwan] = getPlaylists(territory: .taiwan)
        playlistList[.hongkong] = getPlaylists(territory: .hongkong)
        playlistList[.japan] = getPlaylists(territory: .japan)
        playlistList[.singapore] = getPlaylists(territory: .singapore)
        playlistList[.malaysia] = getPlaylists(territory: .malaysia)
        
        for (territory, infos) in playlistList {
            for info in infos {
                allPlaylists.playlistArray?.append(setPlaylistsInfo(as: info))
            }
        }

        return allPlaylists
    }
}

class GetSongTracksData: NSObject {
    static func initSongTracksData(_ songTracks: SongTracksAPIData, playlistID: String, territory: KKTerritory) -> SongTracksAPIData {
        var songTracksList: KKTrackList
        
        songTracks.songTracksArray = []
        songTracksList = getSongTrackInPlaylist(playlistID: playlistID, territory: territory)
        
        for info in songTracksList.tracks {
            songTracks.songTracksArray?.append(setSongTrackInfo(as: info))
        }
        
        return songTracks
    }
}

class GetNewAlbumsData: NSObject {
    static func initNewAlbumsData(_ newAlbums: AlbumsAPIData) -> AlbumsAPIData {
        var newAlbumsList: KKAlbumList
        
        newAlbums.albumsArray = []
        newAlbumsList = getNewAlbums(territory: .taiwan, limit: 2).albums!
        
        for i in 0..<10 {
            newAlbums.albumsArray?.append(setAlbumsInfo(as: newAlbumsList.albums[i]))
        }

        return newAlbums
    }
}
