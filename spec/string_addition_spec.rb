describe 'String Addition' do
  describe '.add' do
    context 'given no input' do
      it 'returns 0' do
        expect(add()).to eql(0)
      end
    end
    context 'given an empty string' do
      it 'returns 0' do
        expect(add('')).to eql(0)
      end
    end
    context 'given the string "1,2"' do
      it 'returns 3' do
        expect(add('1,2')).to eql(3)
      end
    end
    context 'given the string "1,2,3,4,5"' do
      it 'returns 15' do
        expect(add('1,2,3,4,5')).to eql(15)
      end
    end
  end
end
