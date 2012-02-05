require 'spec_helper'

describe Category do
  subject { Category.make! }
  
  let(:attr1) do
    {
      :name => 'category 1',
      :code => 'category 1'
    }
  end
  
  it 'should be created' do
    category = Category.new(attr1)
    
    category.valid?.should be_true
  end
end