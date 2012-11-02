$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'mock_factory'

describe MockFactory do

  shared_examples_for 'making an object' do

    it 'makes a mock object' do
      object.should be_a(klass)
    end

    it 'applies a block to the mock' do
      object.should respond_to(method_name)
    end

  end


  let(:klass)  { klass_name.constantize }

  let(:klass_name)  { 'Blark' }

  let(:method_name) { :blark }

  context 'producing' do
    let(:object) { MockFactory.produce klass_name do |b|
                     b.stub(method_name)
                   end
                 }

    let(:ipa) { MockFactory.produce 'Beer' }
    let(:stout) { MockFactory.produce 'Beer' }

    it_behaves_like 'making an object'

    it "produce makes a different object" do
      stout.should_not === ipa
    end

  end


  context 'fetching' do

    let(:object) { MockFactory.fetch klass_name do |b|
                     b.stub(method_name)
                   end
                 }

    let(:ipa) { MockFactory.fetch 'Beer' }
    let(:stout) { MockFactory.fetch 'Beer' }

    it_behaves_like 'making an object'

    it "fetch makes the same object" do
      stout.should === ipa
    end

  end


  context 'stubs' do

    let(:ipa) { MockFactory.fetch 'Beer' do |b|
                  b.stub(:llama).and_return(bill)
                end
              }
    let(:bill) { MockFactory.fetch 'Llama' do |l|
                   l.stub(:spit).and_return("pitooey")
                 end
               }

    it 'does not lose its id by stubbing' do
      bill.should respond_to(:spit)
      bill.id.should_not be_nil
    end

    it 'does not lose its id when re-applying a block' do
      bill.id.should_not be_nil
    end

    it 'blocka blocka blocka!' do
      ipa.llama.should === bill
    end

  end

end
