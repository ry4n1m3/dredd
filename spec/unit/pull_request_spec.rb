require 'spec_helper'

require 'json'

require 'dredd/pull_request'

describe Dredd::PullRequest do
  describe 'constructor' do
    it 'allows the setting of basic attributes' do
      author = Dredd::PullRequestAuthor.new('xoebus', 'xoebus@xoeb.us')
      pull_request = described_class.new(10, 'xoebus/dredd', author)

      expect(pull_request.id).to eq 10
      expect(pull_request.repository).to eq 'xoebus/dredd'
      expect(pull_request.author_username).to eq 'xoebus'
      expect(pull_request.author_email).to eq 'xoebus@xoeb.us'
    end
  end

  describe '.from_hash' do
    let(:github_hash) do
      JSON.parse(asset_contents('pull_request_opened.json'))['pull_request']
    end

    it 'allows the creation of a pull request from a github style hash' do
      pull_request = described_class.from_hash(github_hash)

      expect(pull_request.id).to eq 10
      expect(pull_request.repository).to eq 'xoebus/dredd'
      expect(pull_request.author_username).to eq 'xoebus'
      expect(pull_request.author_email).to eq 'xoebus@xoeb.us'
    end
  end
end