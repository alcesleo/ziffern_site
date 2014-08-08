require 'app/models/german_number'

describe GermanNumber do

  it 'returns a placeholder if called with nil' do
    gn = GermanNumber.from_string(nil)
    expect(gn.input).to eq ''
    expect(gn.output).to eq 'Please enter a number'
  end

  it 'returns a placeholder if called with empty string' do
    gn = GermanNumber.from_string('')
    expect(gn.input).to eq ''
    expect(gn.output).to eq 'Please enter a number'
  end

  it 'has the same input no matter what' do
    gn = GermanNumber.from_string('asdf')
    expect(gn.input).to eq 'asdf'
  end

  it 'returns converted number on correct input' do
    expect(GermanNumber.from_string('12').output).to eq 'zwölf'
  end

  it 'ignores whitespace' do
    expect(GermanNumber.from_string('1 1').output).to eq 'elf'
  end

end
