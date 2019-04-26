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
  end
end
