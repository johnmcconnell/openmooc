module ApplicationHelper
  def parse_wiki(text)
    WikiCloth::Parser.new(data: text).to_html
  end
end
