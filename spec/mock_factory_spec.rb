$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'mock_factory'

describe MockFactory do

  it "create makes a mock object" do
    o = MockFactory.create 'Blark'
    o.should be_a(Blark)
  end


  it "create applies a block to the mock" do
    b = MockFactory.create 'Badger' do |b|
          b.stub(:honey).and_return(true)
        end
    b.honey.should be_true
  end


  it "create makes a different object" do
    stout = MockFactory.create 'Beer'
    ipa = MockFactory.create 'Beer'
    stout.should_not === ipa
  end


  it "fetch makes a mock object" do
    o = MockFactory.fetch 'Blark'
    o.should be_a(Blark)
  end


  it "fetch applies a block to the mock" do
    b = MockFactory.fetch 'Badger' do |b|
          b.stub(:honey).and_return(true)
        end
    b.honey.should be_true
  end


  it "fetch makes the same object" do
    stout = MockFactory.fetch 'Beer'
    ipa = MockFactory.fetch 'Beer'
    stout.should === ipa
  end

end
