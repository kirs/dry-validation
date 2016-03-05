RSpec.describe Dry::Validation::Schema do
  subject(:validation) { schema.new }

  describe 'defining schema with optional keys' do
    let(:schema) do
      Class.new(Dry::Validation::Schema) do
        optional(:email) { |email| email.filled? }

        key(:address) do
          key(:city, &:filled?)
          key(:street, &:filled?)

          optional(:phone_number) do
            none? | str?
          end
        end
      end
    end

    describe '#call' do
      it 'skips rules when key is not present' do
        expect(validation.(address: { city: 'NYC', street: 'Street 1/2' })).to be_success
      end

      it 'applies rules when key is present' do
        expect(validation.(email: '')).to_not be_success
      end
    end
  end
end
