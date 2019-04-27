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
    context 'given the string "1,2,5"' do
      it 'returns 8' do
        expect(add("1,2,5")).to eql(8)
      end
    end
    context 'given the input string includes "\n" character(s)' do
      it 'returns 6 when input is "1\n,2,3"' do
        expect(add("1\n,2,3")).to eql(6)
      end
      it 'returns 7 when input is "1\n,2,4"' do
        expect(add("1,\n,2,4")).to eql(7)
      end
      it 'returns 8 when input is "2\n,\n2,4\n"' do
        expect(add("2\n,\n2,4\n")).to eql(8)
      end
    end
    context 'given the string contains values larger than 1000"' do
      it 'ignores values large than 1000 with an input "2,1001"' do
        expect(add("2,1001")).to eql(2)
      end
    end
    context 'given the input string includes any single-character as delimiter instead of ","' do
      it 'returns 8 when input is "//;\n1;3;4"' do
        expect(add("//;\n1;3;4")).to eql(8)
      end
      it 'returns 8 when input is "//$\n1$2$3"' do
        expect(add("//$\n1$2$3")).to eql(6)
      end
      it 'returns 7 when input is "//@\n2@2@1\n@2"' do
        expect(add("//@\n2@2@1\n@2")).to eql(7)
      end
      it 'returns 13 when input is "//@\n2@3@8"' do
        expect(add("//@\n2@3@8")).to eql(13)
      end
    end
    context 'given the input string includes a multi-character as delimiter instead of ","' do
      it 'returns 5 when input is "//@@\n2@@2@@1"' do
        expect(add("//@@\n2@@2@@1")).to eql(5)
      end
      it 'returns 7 when input is "//***\n2***2***1\n***2"' do
        expect(add("//***\n2***2***1\n***2")).to eql(7)
      end
    end
    context 'given the input string includes a negative number' do
      it 'throws an expection' do
        expect{ add("1,-2") }.to raise_error(RuntimeError)
      end
      it 'throws an expection with error msg "Negatives not allowed"' do
        expect{ add("1,-2") }.to raise_error(RuntimeError, /Negatives not allowed/)
      end
      it 'throws an expection displaying invalid values' do
        expect{ add("1,-2,-5") }.to raise_error(RuntimeError, /\[-2, -5\]/)
      end
    end
  end
end
