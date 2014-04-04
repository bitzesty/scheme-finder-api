require "spec_helper"

describe "Importing companies via csv" do
  let(:admin) { create :admin }
  before { sign_in_user(admin) }

  context "When import fails" do
    it "Then displays failed result" do
      visit import_form_import_via_csv_schemes_path
      upload_csv_file

      expect_to_see "scheduled"
      expect_to_see "Completed"
      expect_to_see "0 failed"

      click_on "0 failed"
    end
  end

  private
  def upload_csv_file
    attach_file "csv_import_file", Rails.root.join('spec', 'fixtures', 'schemes.csv')
    click_on "Import"
  end
end
