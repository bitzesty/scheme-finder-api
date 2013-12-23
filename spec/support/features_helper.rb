module FeaturesHelpers
  def verify(call)
    expect(call).to be(true)
  end

  def refute(call)
    expect(call).to be(false)
  end

  def dom_id_for(*args)
    ActionView::RecordIdentifier.dom_id(*args)
  end

  def dom_id_selector(*args)
    "##{dom_id_for(*args)}"
  end

  def ensure_on(path)
    visit(path) unless current_path == path
  end
end
