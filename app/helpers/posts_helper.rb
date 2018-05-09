module PostsHelper
  def formate_date(date)
    "#{date.year}年#{date.month}月#{date.day}日"
  end
end
