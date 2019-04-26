describe 'String Addition' do
  describe '.add' do
    context 'given an empty string' do
      it 'returns 0' do
        expect(add()).to eql(0)
      end
    end
  end
end
