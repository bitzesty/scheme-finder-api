module Backend
  module SchemeSteps
    # Query
    #
    # returns true if scheme is created, i.e. can be seen in admin
    # scheme list UI
    def scheme_created?(scheme)
      ensure_on backend_schemes_path

      page.has_css?(schemes_table) &&
      within(schemes_table) do
        page.has_content?(scheme.name)
      end
    end

    # Command
    #
    # creates a scheme given mock scheme instance
    def create_scheme(scheme)
      ensure_on new_backend_scheme_path

      within(:css, dom_id_selector(scheme)) do
        check "scheme_confirmed" if scheme.confirmed
        fill_in "scheme_contact_name", with: scheme.contact_name
        fill_in "scheme_contact_phone", with: scheme.contact_phone
        fill_in "scheme_contact_email", with: scheme.contact_email
        fill_in "scheme_name", with: scheme.name
        fill_in "scheme_website", with: scheme.website
        fill_in "scheme_description", with: scheme.description
        select scheme.locations.first, from: "scheme_location_ids"
        select scheme.sectors.first, from: "scheme_sector_ids"
        select scheme.commitment_lengths.first, from: "scheme_commitment_length_ids"
        select scheme.activities.first, from: "scheme_activity_ids"
        select scheme.company_sizes.first, from: "scheme_company_size_ids"
        select scheme.age_ranges.first, from: "scheme_age_range_ids"
      end

      click_button "submit_btn"
    end

    # Command
    #
    # Removes scheme using backend interface
    def remove_scheme(scheme)
      ensure_on backend_schemes_path

      within(schemes_table) do
        click_link "Remove"
      end
    end

    # Command
    #
    # Updates scheme's details
    def update_scheme(scheme, new_details = {})
      ensure_on edit_backend_scheme_path(scheme)

      new_details.each do |field, value|
        fill_in "scheme_#{field}", with: value
      end

      click_button "submit_btn"
    end

    # Query
    #
    # Checks if scheme details were updated
    def scheme_updated?(scheme, updated_details = {})
      ensure_on edit_backend_scheme_path(scheme)

      updated_details.all? { |field, value|
        has_field?("scheme_#{field}", with: value)
      }
    end

    def schemes_table
      "table.schemes-table"
    end

    # Query
    #
    # Checks if scheme is listed among unconfirmed ones
    def scheme_not_confirmed?(scheme)
      unless scheme_confirmed?(scheme)
        ensure_on unconfirmed_backend_schemes_path
        page.has_css?(schemes_table) &&
        within(schemes_table) do
          page.has_content?(scheme.name)
        end
      end
    end

    # Command
    #
    # Confirms scheme
    def confirm_scheme(scheme, new_details = {})
      ensure_on edit_backend_scheme_path(scheme)

      check "scheme_confirmed"

      click_button "submit_btn"
    end

    # Query
    #
    # Checks if scheme was confirmed
    def scheme_confirmed?(scheme)
      ensure_on edit_backend_scheme_path(scheme)

      has_checked_field?("scheme_confirmed")
    end
  end
end