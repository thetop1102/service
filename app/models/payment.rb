class Payment < ApplicationRecord
  belongs_to :booking, optional: true
  belongs_to :bank_account, optional: true

  enum classify: [:normal, :daily]

  def paypal_url return_path
    values = {
      business: "vuhuutuan262-buyer-2@gmail.com",
      return: "http://thawing-garden-44807.herokuapp.com/#{return_path}",
      notify_url: "https://www.sandbox.paypal.com/update",
      invoice: id,
      cmd: "_xclick",
      amount: amount,
    }
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" +
      values.to_query
  end
end
