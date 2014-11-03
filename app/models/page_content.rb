class PageContent < ActiveRecord::Base
  validates_length_of :content, maximum: 1500
  validates_length_of :html, maximum: 3000
  before_save :render_html

  def to_s
    html.html_safe
  end

  private

  def render_html
    self.html = Redcarpet::Markdown.new(
      Redcarpet::Render::HTML, autolink: true, tables: true
    ).render(content)
  end
end
