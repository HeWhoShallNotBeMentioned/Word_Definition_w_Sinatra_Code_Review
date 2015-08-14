class Word
  @@all_words = []

  attr_reader(:word, :id, :definition)

  define_method(:initialize) do |attributes|
    @word = attributes.fetch(:word)
    @id = @@all_words.length().+1
    @definition = []
  end

  define_singleton_method(:all) do
    @@all_words
  end

  define_method(:save) do
    @@all_words.push(self)
  end

  define_singleton_method(:clear) do
    @@all_words = []
  end

  define_method(:add_definition) do
    @definition.push.(definition)
  end

  define_singleton_method(:find) do |id|
    found_word = nil
    @@all_words.each() do |word|
      if word.id().eql?(id)
        found_word = word
      end
    end
    found_word
  end


end
