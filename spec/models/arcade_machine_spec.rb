require "rails_helper"

RSpec.describe ArcadeMachine, type: :model do
  let(:arcade_machine) { FactoryGirl.create(:arcade_machine) }

  describe "#subscribed?" do
    let(:good_playlist) { FactoryGirl.create(:playlist) }
    let(:bad_playlist)  { FactoryGirl.create(:playlist) }

    before :each do
      Subscription.create! arcade_machine: arcade_machine, playlist: good_playlist
    end

    it "is true for playlists subscribed to" do
      expect(arcade_machine.subscribed?(good_playlist)).to eq true
    end

    it "is false for playlists not subscribed to" do
      expect(arcade_machine.subscribed?(bad_playlist)).to eq false
    end

  end
end