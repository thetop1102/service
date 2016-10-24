require "rake"

namespace :payment do
  task create_daily_payment_report: :environment do
    time_range = 6.hours.ago..Time.current
    payments = Payment.where(created_at: time_range)
    daily_total_price = 0
    payments.each do |payment|
      daily_total_price = daily_total_price + payment.amount
    end

    Payment.create classify: 1, amount: daily_total_price
  end
end
