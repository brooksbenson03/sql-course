SELECT contents, url
FROM comments
JOIN photos ON photos.id = comments.user_id