# KanjiToKana

漢字の単語をひらがなに変換するツール、データはウィキペディアから取ってくる。

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kanji_to_kana'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kanji_to_kana

## Usage

Console:

    $ kanji_to_kana 梶浦由記
    かじうら ゆき

Ruby:

    KanjiToKana.convert('澤野弘之')
    # => さわの ひろゆき
