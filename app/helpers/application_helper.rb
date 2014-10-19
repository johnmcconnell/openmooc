require 'nokogiri'

module ApplicationHelper
  def parse_wiki(wikitext)
    WikiCloth::Parser.new(data: wikitext).to_html
  end

  def summary_text(wikitext)
   truncate Nokogiri::HTML(parse_wiki(wikitext)).text, length: 350
  end
end
