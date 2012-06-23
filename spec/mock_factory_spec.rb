$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'mock_factory'

describe MockFactory do

  it "makes a mock object" do
    defined?(Blark).should be_nil
    o = MockFactory.create 'Blark'
    o.should be_a(Blark)
  end


  it "applies a block to the mock" do
    b = MockFactory.create 'Badger' do |b|
          b.stub(:honey).and_return(true)
        end
    b.honey.should be_true
  end


  it "makes the same object" do
    stout = MockFactory.create 'Beer'
    ipa = MockFactory.create 'Beer'
    stout.should === ipa
  end

end
