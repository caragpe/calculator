describe 'String Addition' do
  describe '.add' do
    context 'given no input' do
      it 'returns 0' do
        expect(add()).to eql(0)
      end
    end
    context 'given an empty string' do
      it 'returns 0' do
        expect(add("")).to eql(0)
      end
    end
    context 'given the string "1,2"' do
      it 'returns 3' do
        expect(add("1,2")).to eql(3)
      end
    end
    context 'given the string "1,2,3,4,5"' do
      it 'returns 15' do
        expect(add("1,2,3,4,5")).to eql(15)
      end
    end
    context 'given the input string includes "\n" character(s)' do
      it 'returns 6 when input is "1,\n2,3"' do
        expect(add("1,\n2,3")).to eql(6)
      end
      it 'returns 7 when input is "1\n,2,4"' do
        expect(add("1,\n,2,4")).to eql(7)
      end
      it 'returns 8 when input is "2\n,\n2,4\n"' do
        expect(add("2\n,\n2,4\n")).to eql(8)
      end
    end
  end
end
