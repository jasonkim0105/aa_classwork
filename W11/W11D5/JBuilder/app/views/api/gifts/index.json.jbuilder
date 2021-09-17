json.array! @gifts do |gift|
    # json.name guest.name
    # json.age guest.age
    # json.favorite_color guest.favorite_color
    json.partial! 'gift', gift: gift
  end