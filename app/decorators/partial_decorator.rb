class PartialDecorator < Draper::Decorator

  alias_method :orig_to_partial_path, :to_partial_path

  def to_partial_path(view = nil)
    if view.nil?
      orig_to_partial_path
    else
      collection = ActiveSupport::Inflector.tableize(object.class.name)
      "#{collection}/#{String(view)}".freeze
    end
  end
end
