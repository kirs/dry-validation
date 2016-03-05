RSpec.describe 'Schema / Injecting Rules' do
  let(:validate) { schema.new(other.rules) }

  let(:other) do
    Class.new(Dry::Validation::Schema) do
      key(:login) { |value| value.bool? }
    end
  end

  let(:schema) do
    Class.new(Dry::Validation::Schema) do
      key(:email) { none? | filled? }

      rule(email: :filled?) { value(:login).true? > value(:email).filled? }
    end
  end

  it 'appends rules from another schema' do
    expect(validate.(login: true, email: 'jane@doe')).to be_success
    expect(validate.(login: false, email: nil)).to be_success
    expect(validate.(login: true, email: nil)).to_not be_success
  end
end
