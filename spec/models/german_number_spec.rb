require 'app/models/german_number'

describe GermanNumber do

  it 'returns a placeholder if called with nil' do
    gn = GermanNumber.from_string(nil)
    expect(gn.input).to eq ''
    expect(gn.output).to eq 'Bitte geben Sie eine Zahl ein'
  end

  it 'returns a placeholder if called with empty string' do
    gn = GermanNumber.from_string('')
    expect(gn.input).to eq ''
    expect(gn.output).to eq 'Bitte geben Sie eine Zahl ein'
  end

  it 'strips the text' do
    gn = GermanNumber.from_string(' ')
    expect(gn.input).to eq ''
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

  it 'does not crash when getting a too large number' do
    expect(GermanNumber.from_string('9' * 127).output).to eq 'zu groß'
  end

  it 'recognizes invalid numbers' do
    expect(GermanNumber.from_string('invalid').output).to eq 'ungültig'
  end

  it 'handles commas as decimal points' do
    expect(GermanNumber.from_string('9,9').output).to eq 'neun Komma neun'
  end

end
