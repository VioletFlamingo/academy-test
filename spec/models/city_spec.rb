describe City do

  before(:each) { @city = City.new(name: 'London', short_name: 'Ld') }

  subject { @city }

  it { should respond_to(:name) }

  it "#name returns a string" do
    expect(@city.name).to match 'London'
  end

  it { should respond_to(:short_name) }

  it "#short_name returns a string" do
    expect(@city.short_name).to match 'Ld'
  end

end
