# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kanji_to_kana/version'

Gem::Specification.new do |spec|
  spec.name          = "kanji_to_kana"
  spec.version       = KanjiToKana::VERSION
  spec.authors       = ["weihu_chen"]
  spec.email         = ["cctiger36@gmail.com"]
  spec.summary       = %q{漢字の単語をひらがなに変換するツール}
  spec.description   = %q{漢字の単語をひらがなに変換するツール、データはウィキペディアから取ってくる。}
  spec.homepage      = "https://github.com/cctiger36/kanji_to_kana"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri", "~> 1.6"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
