module ExpectationHelpers
  def expect_to_see(content)
    expect(page).to have_content content
  end

  def expect_to_see_no(content)
    expect(page).to_not have_content content
  end

  def till_see(selector)
    wait_until do
      has_selector?(selector) && find(selector).visible?
    end
  end

  def wait_until(timeout = Capybara.default_wait_time)
    Capybara.send(:timeout, timeout, Capybara.current_driver) { yield }
  end
end
