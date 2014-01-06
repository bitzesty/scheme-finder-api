module Api
  module V1
    class FilterCriteriaController < ApiController
      private

      def criteria_scope
        self.class.name.demodulize.chomp("Controller").underscore
      end
      helper_method :criteria_scope

      def criteria_attributes
        [:id, :name]
      end
      helper_method :criteria_attributes
    end
  end
end
