class RentalPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def create?
    true
  end

  def show?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def update?
    record.user == user
  end

  def index?
    record.user == user
  end

  def edit?
    record.user == user
  end

  def new?
    create?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
