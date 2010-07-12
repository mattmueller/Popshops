require 'spec_helper'

describe "Popshops" do
  context 'initialized with a private api key' do
    before do
      @popshops = Popshops.new('1234', '5678')
    end
    
    describe '#activate_merchants' do
      before do
        @response = response = { :response => mock('response') }
      end
      
      it 'should post to the activate merchants url' do
        Popshops.should_receive(:post).with('https://www.popshops.com/v2/1234/catalogs/update.xml?catalog_key=1357&private_api_key=5678&merchant_id=42', { :query => { :active => 1 } }).and_return(@response)
        @popshops.activate_merchants('1357', '42')
      end
      
      it 'should accept an integer for merchants' do
        Popshops.should_receive(:post).with('https://www.popshops.com/v2/1234/catalogs/update.xml?catalog_key=1357&private_api_key=5678&merchant_id=42', { :query => { :active => 1 } }).and_return(@response)
        @popshops.activate_merchants('1357', 42)
      end
      
      it 'should accept an array of integers for activating multiple merchants' do
        Popshops.should_receive(:post).with('https://www.popshops.com/v2/1234/catalogs/update.xml?catalog_key=1357&private_api_key=5678&merchant_id=42,87', { :query => { :active => 1 } }).and_return(@response)
        @popshops.activate_merchants('1357', [42, 87])
      end
      
      it 'should accept an array of strings for activating multiple merchants' do
        Popshops.should_receive(:post).with('https://www.popshops.com/v2/1234/catalogs/update.xml?catalog_key=1357&private_api_key=5678&merchant_id=42,87', { :query => { :active => 1 } }).and_return(@response)
        @popshops.activate_merchants('1357', ['42', '87'])
      end
    end
    
    describe '#deactivate_merchants' do
      before do
        @response = response = { :response => mock('response') }
      end
      
      it 'should post to the deactivate merchants url' do
        Popshops.should_receive(:post).with('https://www.popshops.com/v2/1234/catalogs/update.xml?catalog_key=1357&private_api_key=5678&merchant_id=42', { :query => { :active => 0 } }).and_return(@response)
        @popshops.deactivate_merchants('1357', '42')
      end
    end
  end
end