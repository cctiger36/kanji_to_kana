require "kanji_to_kana/version"

require "uri"
require "net/http"
require "nokogiri"

module KanjiToKana
  class << self
    def convert(kanji)
      wiki_body = fetch_wiki_page(kanji)
      extract_kana(wiki_body)
    end

    private
      def extract_kana(html)
        doc = Nokogiri::HTML(html, nil, 'utf-8')
        try_extract_from_infobox(doc) || try_extract_from_content(doc)
      end

      def try_extract_from_infobox(doc)
        node = doc.css('.infobox tr').first
        if node
          match = node.text.scan(/[ぁ-ん]+[ぁ-ん ]*/).first
          return match.strip if match
        end
        nil
      end

      def try_extract_from_content(doc)
        node = doc.css('#mw-content-text>p').first
        if node
          match = node.text.scan(/[ぁ-ん]+[ぁ-ん ]*/).first
          return match.strip if match
        end
        nil
      end

      def fetch_wiki_page(kanji)
        uri = URI.parse(wiki_url_string(kanji))
        http = Net::HTTP.new(uri.host, uri.port)
        request = Net::HTTP::Get.new(uri.path)
        response = http.start do |h|
          h.request(request)
        end
        response.body
      end

      def wiki_url_string(kanji)
        "http://ja.wikipedia.org/wiki/#{URI.encode(kanji.gsub(/\s/, ''))}"
      end
  end
end
