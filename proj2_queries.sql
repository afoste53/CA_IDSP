-- Which tracks appeared in the most playlists? How many playlists did they appear in? 
SELECT tracks.name as "Song Name", COUNT(playlist_track.PlaylistId) AS "Number of Playlists"
from playlist_track 
JOIN tracks
ON playlist_track.TrackId = tracks.TrackId
GROUP BY tracks.TrackId
ORDER BY 2 DESC;

-- Which track generated the most revenue? Album? Genre? 
-- Tracks if done by trackid, ie which track specifically (from the same album, etc) generated
SELECT tracks.Name AS name, SUM(Total) as Total 
FROM tracks JOIN invoice_items 
ON tracks.TrackId = invoice_items.TrackId
JOIN invoices
ON invoice_items.InvoiceId = invoices.InvoiceId
GROUP BY tracks.TrackId
ORDER BY 2 DESC;

-- Tracks if done by name -> Consider the same song if regardless of when it was cut, which album, etc
SELECT tracks.Name AS name, SUM(Total) as Total 
FROM tracks JOIN invoice_items 
ON tracks.TrackId = invoice_items.TrackId
JOIN invoices
ON invoice_items.InvoiceId = invoices.InvoiceId
GROUP BY 1
ORDER BY 2 DESC;

