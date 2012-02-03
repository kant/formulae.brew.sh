# This code is free software; you can redistribute it and/or modify it under
# the terms of the new BSD License.
#
# Copyright (c) 2012, Sebastian Staudt

require 'spec_helper'

describe 'routing' do
  it 'routes / to application#home' do
    { get: '/' }.should route_to('application#home')
  end
  
  it 'routes /browse/:letter to formulae#index' do
    { get: '/browse/a' }.should route_to(
      'formulae#index',
      letter: 'a'
    )
  end

  it 'routes /browse/:letter/:page to formulae#index' do
    { get: '/browse/a/2' }.should route_to(
      'formulae#index',
      letter: 'a',
      page: '2'
    )
  end

  it 'routes /search/:search to formulae#index' do
    { get: '/search/git' }.should route_to(
      'formulae#index',
      search: 'git'
    )
  end

  it 'routes /search/:search/:page to formulae#index' do
    { get: '/search/git/2' }.should route_to(
      'formulae#index',
      search: 'git',
      page: '2'
    )
  end

  it 'routes /formula/:name to formulae#show for name' do
    { get: '/formula/git' }.should route_to(
      'formulae#show',
      id: 'git'
    )
  end

  it 'routes /feed.atom to formulae#feed' do
    { get: '/feed.atom' }.should route_to('formulae#feed', format: 'atom')
  end

  it 'routes /sitemap.xml to formulae#sitemap' do
    { get: '/sitemap.xml' }.should route_to('formulae#sitemap', format: 'xml')
  end
  
  it 'routes unknown URLs to application#not_found' do
    { get: '/unknown' }.should route_to('application#not_found', url: 'unknown')
  end
end