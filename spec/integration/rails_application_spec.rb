require 'fixtures/fake_rails_application'
require 'rspec/rails'

describe ConferencesController, type: :controller do
  before do
    get :show, id: 'RuPy'
  end

  describe "inside a view" do
    it "should be a decorator" do
      expect(controller.view_context.conference).to be_instance_of(ConferenceDecorator)
    end

    it "should have decorated conference" do
      expect(controller.view_context.conference.decorated_object).to be_instance_of(Conference)
    end

    it "should be specified decorator" do
      expect(controller.view_context.other_conference).to be_instance_of(CoolConferenceDecorator)
    end

    it "should cache decorator" do
      expect(controller.view_context.conference.object_id).to eq controller.view_context.conference.object_id
    end

    it "should cache decorated object" do
      expect(controller.view_context.conference.decorated_object.object_id).to eq controller.view_context.conference.decorated_object.object_id
    end
  end

  describe "inside a controller" do
    it "should be undecorated object" do
      expect(controller.conference).to be_instance_of(Conference)
    end

    it "should not be specified decorator" do
      expect(controller.other_conference).to be_instance_of(Conference)
    end
  end
end
