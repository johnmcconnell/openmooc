class PageDecorator < PartialDecorator
  delegate_all

  def number
    position
  end
end
