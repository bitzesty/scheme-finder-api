module CommonSteps
  def ensure_on(path)
    visit(path) unless current_path == path
  end

  def last_email
    ActionMailer::Base.deliveries.last
  end
end
