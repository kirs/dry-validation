RSpec.describe 'Predicates: Hash' do
  context 'with required' do
    subject(:schema) do
      Dry::Validation.Form do
        required(:foo) { hash? }
      end
    end

    context 'with valid input' do
      let(:input) { { 'foo' => { 'street' => 'Baker' } } }

      it 'is successful' do
        expect(result).to be_successful
      end
    end

    context 'with missing input' do
      let(:input) { {} }

      xit 'is not successful' do
        expect(result).to be_failing ['is missing', 'must be a hash']
      end
    end

    context 'with nil input' do
      let(:input) { { 'foo' => nil } }

      xit 'is not successful' do
        expect(result).to be_failing ['must be a hash']
      end
    end

    context 'with blank input' do
      let(:input) { { 'foo' => '' } }

      xit 'is not successful' do
        expect(result).to be_failing ['must be a hash']
      end
    end
  end

  context 'with optional' do
    subject(:schema) do
      Dry::Validation.Form do
        optional(:foo) { hash? }
      end
    end

    context 'with valid input' do
      let(:input) { { 'foo' => { 'street' => 'Baker' } } }

      it 'is successful' do
        expect(result).to be_successful
      end
    end

    context 'with missing input' do
      let(:input) { {} }

      it 'is successful' do
        expect(result).to be_successful
      end
    end

    context 'with nil input' do
      let(:input) { { 'foo' => nil } }

      xit 'is not successful' do
        expect(result).to be_failing ['must be a hash']
      end
    end

    context 'with blank input' do
      let(:input) { { 'foo' => '' } }

      xit 'is not successful' do
        expect(result).to be_failing ['must be a hash']
      end
    end
  end
end
