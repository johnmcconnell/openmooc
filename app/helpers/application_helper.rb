
module ApplicationHelper
  def parse_wiki(wikitext)
    Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true).render(wikitext)
  end

  def summary_text(wikitext)
   truncate wikitext, length: 350
  end
end
