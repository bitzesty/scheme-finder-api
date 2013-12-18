module ModalHelper

  #   id - String, html dom id
  #
  # Examples
  #
  #   open_modal '#new_user_form'
  #
  #   open_modal '#new_user_form' do
  #     fill_in 'Name', 'fffo'
  #   end
  #
  def open_modal(id)
    click_on ":#{id}"

    till_see id

    if block_given?
      within id do
        yield
      end
    end
  end
  alias_method :switch_to_tab, :open_modal

end
