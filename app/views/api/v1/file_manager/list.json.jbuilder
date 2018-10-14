json.contents @images.each do |image|
  json.name  image.split('/').last
  json.url   image.gsub('public', 'http://localhost:3000')
end
