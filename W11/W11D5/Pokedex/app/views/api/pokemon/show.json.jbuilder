json.set! 'pokemon' do 
    json.extract! @pokemon, :id, :name
    json.image_url asset_path("pokemon_snaps/#{@pokemon.image_url}")
end

json.set! 'moves' do
    @pokemon.moves.each do |move|
        json.set! move.id do 
            json.extract! move, :name, :id
        end
    end
end

json.set! 'items' do
    @pokemon.items.each do |item|
        json.set! item.id do
            json.extract! item, :id, :pokemon_id, :name, :price, :happiness
            json.image_url asset_path("#{item.image_url}")
        end
    end
end