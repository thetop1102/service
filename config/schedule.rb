every :day do
  rake "discount:update_discounts_status"
end

every 6.hours do 
  rake "rating:update_tours_rating"
end

every 6.hours do
  rake "payment:create_daily_payment_report"
end
