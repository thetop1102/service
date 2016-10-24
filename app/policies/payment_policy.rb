class PaymentPolicy < ApplicationPolicy
  def index?
    user.try :is_admin?
  end
end
