require('rspec')
require('definition.rb')

describe(Definition) do
  before() do
    Word.clear()
  end

  describe('#definition') do
    it('returns the word definition') do
      test_definition = Definition.new('the best game ever played')
      expect(test_definition.definition()).to(eq('the best game ever played'))
    end
  end
end
