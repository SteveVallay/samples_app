require 'spec_helper'

describe 'User page' do
  subject{page}
  describe 'Sign up page' do
    before {visit signup_path}
    it { should have_selector('h1',text: 'Sign up') } 
    it { should have_selector('title',text: 'Sign up') }
  end
end

