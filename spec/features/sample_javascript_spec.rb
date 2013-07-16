#! ruby -Ku
# coding: utf-8
require 'spec_helper'

describe 'JavaScript test' do
  it 'requests GET /sample enable javascript' do
    visit('https://www.google.co.jp/')

    within('body') do
      fill_in 'q', :with => 'schoo'
      #click_link 'link text'
      #click_on 'link text or button'
      click_button 'Google 検索'
    end

    #expect(page.find('em').text).to eq('スクー')
    expect(page).to have_content 'schoo WEB-campus'
  end
end

