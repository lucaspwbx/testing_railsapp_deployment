json.array!(@players) do |player|
  json.extract! player, :id, :name, :address
  json.url player_url(player, format: :json)
end
