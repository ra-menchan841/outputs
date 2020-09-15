require 'rouge/plugins/redcarpet'

class HTML < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet
end

module MarkdownHelper
  def markdown(text)
    unless @markdown
      options = {
        filter_html: true,
        autolink: true,
        space_after_headers: true,
        no_intra_emphasis: true,
        fenced_code_blocks: true,
        tables: true,
        hard_wrap: true,
        xhtml: true,
        lax_html_blocks: true,
        strikethrough: true
      }
      renderer = HTML.new(options)
      @markdown = Redcarpet::Markdown.new(renderer, fenced_code_blocks: true) 
    end

    @markdown.render(text).html_safe
  end
end