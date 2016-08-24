require 'spec_helper'
require 'fixtures/fake_rails_application'
require 'rspec/rails'

describe AttendeesController, type: :controller do
  before do
    get :show, id: 'dave'
  end

  it "should be a decorator" do
    expect(controller.view_context.attendee).to be_instance_of(AttendeeDecorator)
  end

  it "should be a decorator in collection" do
    controller.view_context.attendees.each do |attendee|
      expect(attendee).to be_instance_of(AttendeeDecorator)
    end
  end
end
