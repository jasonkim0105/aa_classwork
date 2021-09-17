# json.guest do
 # json.extract! @guest, :name, :age, :favorite_color
# end

json.partial! 'gift', gift: @gift

