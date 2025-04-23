# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "seedの実行を開始"

Admin.find_or_create_by!(email: "admin@example.com") do |admin|
  admin.password = ENV["ADMIN_PASS"]
  admin.password_confirmation = ENV["ADMIN_PASS"]
end

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
Game.find_or_create_by!(title: "サンプルゲーム1") do |game|
  game.game_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-game1.jpg"), filename:"sample-game1.jpg")
  game.title = "サンプルゲーム1"
  game.body = "サンプルのゲームです。"
  game.price = 1000
  game.genre_id = Genre.find_by(name: "アクション").id
end

Game.find_or_create_by!(title: "サンプルゲーム2") do |game|
  game.game_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-game2.jpg"), filename:"sample-game2.jpg")
  game.title = "サンプルゲーム2"
  game.body = "サンプルのゲームです。"
  game.price = 2000
  game.genre_id = Genre.find_by(name: "アドベンチャー").id
end

Game.find_or_create_by!(title: "サンプルゲーム3") do |game|
  game.game_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-game3.jpg"), filename:"sample-game3.jpg")
  game.title = "サンプルゲーム3"
  game.body = "サンプルのゲームです。"
  game.price = 3000
  game.genre_id = Genre.find_by(name: "RPG").id
end

#レビューの生成
Review.find_or_create_by!(user_id: lucas.id, game_id: Game.find_by(title: "サンプルゲーム1").id) do |review|
  review.title = "サンプルレビュー1"
  review.body = "サンプルのレビューです。"
  review.star = 4.5
end
Review.find_or_create_by!(user_id: lucas.id, game_id: Game.find_by(title: "サンプルゲーム2").id) do |review|
  review.title = "サンプルレビュー2"
  review.body = "サンプルのレビューです。"
  review.star = 3.5
end
Review.find_or_create_by!(user_id: lucas.id, game_id: Game.find_by(title: "サンプルゲーム3").id) do |review|
  review.title = "サンプルレビュー3"
  review.body = "サンプルのレビューです。"
  review.star = 5.0
end
Review.find_or_create_by!(user_id: james.id, game_id: Game.find_by(title: "サンプルゲーム1").id) do |review|
  review.title = "サンプルレビュー4"
  review.body = "サンプルのレビューです。"
  review.star = 2.5
end
Review.find_or_create_by!(user_id: james.id, game_id: Game.find_by(title: "サンプルゲーム2").id) do |review|
  review.title = "サンプルレビュー5"
  review.body = "サンプルのレビューです。"
  review.star = 4.0
end
Review.find_or_create_by!(user_id: james.id, game_id: Game.find_by(title: "サンプルゲーム3").id) do |review|
  review.title = "サンプルレビュー6"
  review.body = "サンプルのレビューです。"
  review.star = 3.0
end
Review.find_or_create_by!(user_id: olivia.id, game_id: Game.find_by(title: "サンプルゲーム3").id) do |review|
  review.title = "サンプルレビュー7"
  review.body = "サンプルのレビューです。"
  review.star = 3.5
end
Review.find_or_create_by!(user_id: olivia.id, game_id: Game.find_by(title: "サンプルゲーム2").id) do |review|
  review.title = "サンプルレビュー8"
  review.body = "サンプルのレビューです。"
  review.star = 2.5
end
Review.find_or_create_by!(user_id: olivia.id, game_id: Game.find_by(title: "サンプルゲーム1").id) do |review|
  review.title = "サンプルレビュー9"
  review.body = "サンプルのレビューです。"
  review.star = 1.0
end

puts "seedの実行が完了しました"