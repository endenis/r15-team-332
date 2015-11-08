require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  let!(:question) { FactoryGirl.create(:question) }

  describe '#show' do

    it 'returns a question' do
      response = controller.retrieve_question question.id
      expect(response.to_json).to be_truthy
    end

    it 'does not create a question' do

    end

    it 'create a photo' do
    end

  end

end
