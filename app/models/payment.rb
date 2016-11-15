class Payment < ApplicationRecord
  belongs_to :booking, optional: true
  belongs_to :bank_account, optional: true
end
