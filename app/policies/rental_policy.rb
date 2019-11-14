class RentalPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def create?
    true
  end

  def edit?
    true
  end

  def update?
    true
  end

  def show?
    true
  end

  def index?
    true
  end

  def destroy?
    true
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
