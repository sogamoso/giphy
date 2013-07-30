require 'spec_helper'

describe Giphy::NullImage do
  subject { Giphy::NullImage.new }

  its(:url)    { should eq URI('') }
  its(:width)  { should eq 0 }
  its(:height) { should eq 0 }
  its(:size)   { should eq 0 }
  its(:frames) { should eq 0 }
end
