class BoatPolicy < ApplicationPolicy

    def create?
        true
      end

      def show?
        true
      end

      def destroy?
        true
       end

      def update?
        true
      end

      def boat_new?
        true
      end

      def boat_show?
        true
      end

      def boat_create?
        true
      end

      def boat_delete?
        true
      end

      def boat_edit?
        true
      end

      def boat_update?
        true
      end

      def boats?
        true
      end

      def boat?
        true
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
