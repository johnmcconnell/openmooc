
module ApplicationHelper
  def parse_wiki(wikitext)
    WikiCloth::Parser.new(data: wikitext).to_html
  end

  def summary_text(wikitext)
   truncate wikitext, length: 350
  end
end
