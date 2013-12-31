module Backend
  module SchemesHelper
    def schemes_index_title
      if action_name == "unconfirmed"
        "Unconfirmed schemes"
      else
        "Schemes"
      end
    end
  end
end
