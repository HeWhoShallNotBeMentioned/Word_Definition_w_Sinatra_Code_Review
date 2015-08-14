require('rspec')
require('definition.rb')

describe(Definition) do

  describe('#definition') do
    it('returns the word definition') do
      test_definition = Definition.new({:definition => 'the best game ever played'})
      expect(test_definition.definition()).to(eq('the best game ever played'))
    end
  end
end
