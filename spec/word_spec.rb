require('rspec')
require('word.rb')

describe('Word') do
  before() do
    Word.clear()
  end

describe('#word') do
  it('returns the word') do
    test_word = Word.new({:word => "baseball"})
    expect(test_word.word()).to(eq("baseball"))
  end
end

describe(".all") do
    it("is empty at first") do
      expect(Word.all()).to(eq([]))
    end
  end

 describe("#save") do
    it("adds a word to the array of saved words") do
      test_word = Word.new({:word => "baseball"})
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

 describe(".clear") do
    it("empties out all of the saved words") do
      Word.new({:word => "baseball"}).save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end


end
