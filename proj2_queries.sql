/** Which tracks appeared in the most playlists? How many playlists did they appear in? **/
SELECT tracks.name as "Song Name", COUNT(playlist_track.PlaylistId) AS "Number of Playlists"
from playlist_track 
JOIN tracks
ON playlist_track.TrackId = tracks.TrackId
GROUP BY tracks.TrackId
ORDER BY 2 DESC;

/** Which track generated the most revenue? Album? Genre? **/
