require 'spec_helper'

module Compressit
  describe Base do
    
    describe '#test' do
      it 'prints out test' do
        output = double('output')
        output
        Base.test
      end
    end
    
  end
end