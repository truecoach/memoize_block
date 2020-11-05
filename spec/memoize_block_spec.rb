# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MemoizeBlock, '#memoize' do
  let(:memoized_name) { nil }
  let(:returned_value) { 'default' }
  let(:action) { ->(returned) { return returned } }

  def memoize_result
    memoize(memoized_name) do
      action.call(returned_value)
    end
  end

  context 'given standard behavior' do
    it 'memoizes the result' do
      expect(action).to receive(:call).exactly(1).times

      2.times.each { memoize_result }
    end

    it 'stores the result in a default ivar' do
      expect { memoize_result }.to change { instance_variable_defined?('@_memoize_result') }.to(true)
    end
  end

  context 'given a nil result' do
    let(:returned_value) { nil }

    it 'memoizes the result' do
      expect(action).to receive(:call).exactly(1).times

      2.times.each { memoize_result }
    end
  end

  context 'given a custom ivar name' do
    let(:memoized_name) { 'custom_ivar_name' }

    it 'allows the ivar name to be defined' do
      expect { memoize_result }.to change { instance_variable_defined?("@_#{memoized_name}") }.to(true)
    end
  end

  context 'given an invalid custom ivar name' do
    let(:memoized_name) { '@custom_ivar_name' }

    it 'raises an error' do
      expect { memoize_result }.to raise_error(StandardError, /invalid/)
    end
  end

  context 'given an invalid method name' do
    def memoize_result!
      memoize { action.call }
    end

    it 'raises an error' do
      expect { memoize_result! }.to raise_error(StandardError, /invalid/)
    end
  end
end
