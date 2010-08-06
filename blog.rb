#!/usr/bin/env ruby
# coding: utf-8
#Author: Weng Yicheng (wengych at gmail dot com)
#Description: 
require 'rubygems'
require 'sinatra'

set :public, File.dirname(__FILE__)
 
# This before filter ensures that your pages are only ever served
# once (per deploy) by Sinatra, and then by Varnish after that
before do
  response.headers['Cache-Control'] = 'public, max-age=31557600' # 1 year
end
 
get '/' do
    File.read('index.html')
end

get '/*' do
    File.read(params['splat'].first)
end
