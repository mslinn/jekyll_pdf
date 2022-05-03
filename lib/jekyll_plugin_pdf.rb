# frozen_string_literal: true

require 'hexapdf'
require_relative "jekyll_plugin_pdf/version"

# Inspired by the badly broken example on https://jekyllrb.com/docs/plugins/generators/, and completely redone so it works.
module JekyllPluginPdf
  # Creates an index page for each catagory, plus a main index, all within a directory called _site/categories.
  #
  # @param payload [Hash] contains final values of variables after rendering the entire site (useful for sitemaps, feeds, etc).
  Jekyll::Hooks.register(:site, :post_render, priority: :normal) do |site, _payload|
    @logger ||= PluginMetaLogger.instance.new_logger(self, PluginMetaLogger.instance.config)
    @logger.info { "JekyllPluginPdf invoked." }

    pdf = HexaPDF::Document.new
    site.pages.each do |page|
      # create a pdf from string using templates, layouts and content option for header or footer
      pdf = WickedPdf.new.pdf_from_string(
        page.content
        # footer: {
        #   content: render_to_string(
        #     'templates/footer',
        #     layout: 'pdfs/layout_pdf.html'
        #   )
        # }
      )
      File.open("pdfs/#{page.name}.pdf", 'wb') do |file|
        file << pdf
      end
    end
  end

  PluginMetaLogger.instance.logger.info { "Loaded PdfGenerator v#{JekyllPluginPdfVersion::VERSION} plugin." }
end
