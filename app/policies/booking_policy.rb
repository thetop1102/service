class BookingPolicy < ApplicationPolicy
  def new?
    create?
  end

  def create?
    user.present?
  end

  def show?
    user.try :is_admin? or is_owner?
  end

  def index?
    user.try :is_admin?
  end

  def update?
    user.try :is_admin? or is_owner?
  end

  def destroy?
    false
  end

  def cancel?
    is_owner? && record.init?
  end
end
