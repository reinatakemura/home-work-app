json.content @tweet.content
json.user_id @tweet.user.id
json.name @tweet.user.name
json.created_at @tweet.created_at.strftime("%Y/%m/%d %H:%M")
