class BoatPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

    def create?
        true
      end

      def show?
        true
      end

      def destroy?
        record.owner == user
      end

      def update?
        record.owner == user
      end

      def boats?
        true
      end

      def boat?
        true
      end

      class Scope < Scope
        def resolve
          scope.all
        end
    end
end
