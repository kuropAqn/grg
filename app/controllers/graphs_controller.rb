class GraphsController < ApplicationController
  before_action :authenticate_user!

  def index
    # グラフ用のデータを取得
    favorites = Favorite.where(review_id: current_user.reviews.pluck(:id))
    @created_today = favorites.created_today.count
    @created_yesterdey = favorites.created_yesterday.count
    @created_2day_ago = favorites.created_2day_ago.count
    @created_3day_ago = favorites.created_3day_ago.count
    @created_4day_ago = favorites.created_4day_ago.count
    @created_5day_ago = favorites.created_5day_ago.count
    @created_6day_ago = favorites.created_6day_ago.count
  end
  #   case @range
  #   when "month"
  #     from = 1.month.ago.to_date
  #     format = "%m/%d"
  #     step = "day"
  #   when "year"
  #     from = 1.year.ago.to_date.beginning_of_month
  #     format = "%Y/%m"
  #     step = "month"
  #   else
  #     from = 6.days.ago.to_date
  #     format = "%m/%d"
  #     step = "day"
  #   end

  #   @labels, @reviews_data, @favorites_data = chart_data(from, step, format)
  # end

  # private

  # def chart_data(from, step, label_format)
  #   # date_trunc('day' or 'month', ...) を使用したSQLベースのグルーピング
  #   review_counts = current_user.reviews
  #                 .where(created_at: from.beginning_of_day..Time.current)
  #                 .group("strftime('%Y-%m-%d', created_at)")  # SQLite用の日付関数
  #                 .order("strftime('%Y-%m-%d', created_at)")
  #                 .count

  #   # current_user のレビューの ID を取得し、いいねをグルーピング
  #   review_ids = review_counts.empty? ? [] : current_user.reviews.pluck(:id)
  #   favorite_counts = Favorite
  #                   .where(review_id: review_ids)
  #                   .where(created_at: from.beginning_of_day..Time.current)
  #                   .group("strftime('%Y-%m-%d', created_at)")  # SQLite用の日付関数
  #                   .order("strftime('%Y-%m-%d', created_at)")
  #                   .count

  #   # ラベル（日付）一覧を作成
  #   dates = generate_date_range(from, Date.today, step)

  #   labels = dates.map { |date| date.strftime(label_format) }
  #   reviews_data = dates.map { |date| review_counts[date.beginning_of_day.to_time.change(hour: 0)] || 0 }
  #   favorites_data = dates.map { |date| favorite_counts[date.beginning_of_day.to_time.change(hour: 0)] || 0 }

  #   [labels, reviews_data, favorites_data]
  # end

  def generate_date_range(from, to, step)
    case step
    when "day"
      (from..to).to_a
    when "month"
      (from.beginning_of_month..to).map(&:beginning_of_month).uniq
    end
  end
end