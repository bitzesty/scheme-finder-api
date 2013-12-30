module Api
  module V1
    class FilterCriteriaController < ApiController
      private

      def criteria_scope
        self.class.name.demodulize.chomp("Controller").underscore
      end
      helper_method :criteria_scope
    end
  end
end
