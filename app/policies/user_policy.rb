class UserPolicy < ApplicationPolicy

  def initialize(user, record)
    @user = user
    @record = record
  end

  def create?
    true
  end

  def rentals?
    true
  end

  def rental_show?
    true
  end

  def show?
    true
  end

  def rental_delete?
    true
  end

  def update?
    record.user == user
  end

  def search?
    true
  end

  def index?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
