# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "seedの実行を開始"



#ユーザーの生成
olivia = User.find_or_create_by!(email: "olivia@example.com") do |user|
  user.name = "Olivia"
  user.password = "password"
  user.password_confirmation = "password"
  user.is_active = false
end

james = User.find_or_create_by!(email: "james@example.com") do |user|
  user.name = "James"
  user.password = "password"
  user.password_confirmation = "password"
  user.is_active = true
end

lucas = User.find_or_create_by!(email: "lucas@example.com") do |user|
  user.name = "Lucas"
  user.password = "password"
  user.password_confirmation = "password"
  user.is_active = true
end

jack = User.find_or_create_by!(email: "jack@example.com") do |user|
  user.name = "Jack"
  user.password = "password"
  user.password_confirmation = "password"
  user.is_active = true
end

jessica = User.find_or_create_by!(email: "jessica@example.com") do |user|
  user.name = "Jessica"
  user.password = "password"
  user.password_confirmation = "password"
  user.is_active = true
end

tom = User.find_or_create_by!(email: "tom@example.com") do |user|
  user.name = "Tom"
  user.password = "password"
  user.password_confirmation = "password"
  user.is_active = true
end

#ジャンルの生成
Genre.find_or_create_by!(name: "アクション") do |genre|
  genre.name = "アクション"
end
Genre.find_or_create_by!(name: "アドベンチャー") do |genre|
  genre.name = "アドベンチャー"
end
Genre.find_or_create_by!(name: "RPG") do |genre|
  genre.name = "RPG"
end
Genre.find_or_create_by!(name: "シューティング") do |genre|
  genre.name = "シューティング"
end
Genre.find_or_create_by!(name: "パズル") do |genre|
  genre.name = "パズル"
end
Genre.find_or_create_by!(name: "スポーツ") do |genre|
  genre.name = "スポーツ"
end

#ゲームの生成
Game.find_or_create_by!(title: "アクションゲーム1") do |game|
  game.game_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-game1.jpg"), filename:"sample-game1.jpg")
  game.title = "アクションゲーム1"
  game.body = "サンプルのゲームです。"
  game.price = 1000
  game.genre_id = Genre.find_by(name: "アクション").id
end

Game.find_or_create_by!(title: "アクションゲーム2") do |game|
  game.game_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-game1.jpg"), filename:"sample-game1.jpg")
  game.title = "アクションゲーム2"
  game.body = "サンプルのゲームです。サンプルのゲームです。サンプルのゲームです。サンプルのゲームです。サンプルのゲームです。サンプルのゲームです。サンプルのゲームです。サンプルのゲームです。サンプルのゲームです。サンプルのゲームです。サンプルのゲームです。"
  game.price = 2000
  game.genre_id = Genre.find_by(name: "アクション").id
end

Game.find_or_create_by!(title: "アクションゲーム3") do |game|
  game.game_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-game1.jpg"), filename:"sample-game1.jpg")
  game.title = "アクションゲーム3"
  game.body = "サンプルのゲームです。"
  game.price = 3000
  game.genre_id = Genre.find_by(name: "アクション").id
end

Game.find_or_create_by!(title: "アドベンチャーゲーム1") do |game|
  game.game_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-game2.jpg"), filename:"sample-game2.jpg")
  game.title = "サンプルゲーム2"
  game.body = "サンプルのゲームです。"
  game.price = 4000
  game.genre_id = Genre.find_by(name: "アドベンチャー").id
end

Game.find_or_create_by!(title: "アドベンチャーゲーム2") do |game|
  game.game_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-game2.jpg"), filename:"sample-game2.jpg")
  game.title = "サンプルゲーム2"
  game.body = "サンプルのゲームです。"
  game.price = 5000
  game.genre_id = Genre.find_by(name: "アドベンチャー").id
end

Game.find_or_create_by!(title: "RPGゲーム1") do |game|
  game.game_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-game3.jpg"), filename:"sample-game3.jpg")
  game.title = "RPGゲーム1"
  game.body = "サンプルのゲームです。"
  game.price = 6000
  game.genre_id = Genre.find_by(name: "RPG").id
end

Game.find_or_create_by!(title: "RPGゲーム2") do |game|
  game.game_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-game3.jpg"), filename:"sample-game3.jpg")
  game.title = "RPGゲーム2"
  game.body = "サンプルのゲームです。"
  game.price = 7000
  game.genre_id = Genre.find_by(name: "RPG").id
end

Game.find_or_create_by!(title: "RPGゲーム3") do |game|
  game.game_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-game3.jpg"), filename:"sample-game3.jpg")
  game.title = "RPGゲーム3"
  game.body = "サンプルのゲームです。"
  game.price = 8000
  game.genre_id = Genre.find_by(name: "RPG").id
end

Game.find_or_create_by!(title: "シューティングゲーム1") do |game|
  game.game_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-game3.jpg"), filename:"sample-game3.jpg")
  game.title = "シューティングゲーム1"
  game.body = "サンプルのゲームです。"
  game.price = 9000
  game.genre_id = Genre.find_by(name: "シューティング").id
end

Game.find_or_create_by!(title: "シューティングゲーム2") do |game|
  game.game_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-game3.jpg"), filename:"sample-game3.jpg")
  game.title = "シューティングゲーム2"
  game.body = "サンプルのゲームです。"
  game.price = 10000
  game.genre_id = Genre.find_by(name: "シューティング").id
end

Game.find_or_create_by!(title: "パズルゲーム1") do |game|
  game.game_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-game3.jpg"), filename:"sample-game3.jpg")
  game.title = "パズルゲーム1"
  game.body = "サンプルのゲームです。"
  game.price = 1000
  game.genre_id = Genre.find_by(name: "パズル").id
end

Game.find_or_create_by!(title: "パズルゲーム2") do |game|
  game.game_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-game3.jpg"), filename:"sample-game3.jpg")
  game.title = "パズルゲーム2"
  game.body = "サンプルのゲームです。"
  game.price = 1000
  game.genre_id = Genre.find_by(name: "パズル").id
end

Game.find_or_create_by!(title: "パズルゲーム3") do |game|
  game.game_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-game3.jpg"), filename:"sample-game3.jpg")
  game.title = "パズルゲーム3"
  game.body = "サンプルのゲームです。"
  game.price = 1000
  game.genre_id = Genre.find_by(name: "パズル").id
end

Game.find_or_create_by!(title: "スポーツゲーム1") do |game|
  game.game_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-game3.jpg"), filename:"sample-game3.jpg")
  game.title = "スポーツゲーム1"
  game.body = "サンプルのゲームです。"
  game.price = 1000
  game.genre_id = Genre.find_by(name: "スポーツ").id
end

Game.find_or_create_by!(title: "スポーツゲーム2") do |game|
  game.game_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-game3.jpg"), filename:"sample-game3.jpg")
  game.title = "スポーツゲーム2"
  game.body = "サンプルのゲームです。"
  game.price = 1000
  game.genre_id = Genre.find_by(name: "スポーツ").id
end

puts "seedの実行が完了しました"