json.poke do
  json.extract! @pokemon, :id, :name, :attack, :defense, :image_url, :moves
end

json.items @pokemon.items do |item|
  json.extract! item, :id, :name, :pokemon_id, :price, :happiness, :image_url
end
