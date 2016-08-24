require 'spec_helper'

describe DecentDecoration::Decoration do
  let(:klass) { DecentDecoration::Decoration }

  it "should be initialized with name" do
    subject = klass.new(:conference)
    expect(subject.name).to eq :conference
  end

  it "should be initialized with options" do
    subject = klass.new(:conference, { model: :conference })
    expect(subject.options).to eq({ model: :conference })
  end

  describe "#decorated_name" do
    it "should consist of name prepended by decorated" do
      expect(klass.new(:conference).decorated_name).to eq :decorated_conference
    end
  end

  describe "#decorator_class" do
    it "should infer the class from name" do
      expect(klass.new(:conference).decorator_class).to eq ConferenceDecorator
    end

    it "should use :decorator if passed" do
      expect(klass.new(:conference, decorator: AttendeeDecorator).decorator_class).to eq AttendeeDecorator
    end
  end

  describe "#decorate_method" do
    describe "when name is plural" do
      subject { klass.new(:conferences, decorator: decorator) }
      let(:decorator) { double }

      it "should be :decorate_collection if decorator supports it" do
        allow(decorator).to receive(:decorate_collection)
        expect(subject.decorate_method).to eq :decorate_collection
      end

      it "should be :decorate if decorator does not support :decorate_collection and supports :decorate" do
        allow(decorator).to receive(:decorate)
        expect(subject.decorate_method).to eq :decorate
      end

      it "should be :new if decorator does not support :decorate_collection or :decorate" do
        expect(subject.decorate_method).to eq :new
      end

      it "should be :decorate if decorator supports it and collection: false" do
        allow(decorator).to receive(:decorate)
        allow(decorator).to receive(:decorate_collection)
        subject = klass.new(:conferences, decorator: decorator, collection: false)
        expect(subject.decorate_method).to eq :decorate
      end
    end

    describe "when name is singular" do
      subject { klass.new(:conference, decorator: decorator) }
      let(:decorator) { double }

      it "should not be :decorate_collection even if decorator supports it" do
        allow(decorator).to receive(:decorate_collection)
        expect(subject.decorate_method).not_to eq :decorate_collection
      end

      it "should be :decorate_collection if decorator supports it and collection: true" do
        allow(decorator).to receive(:decorate)
        allow(decorator).to receive(:decorate_collection)
        subject = klass.new(:conference, decorator: decorator, collection: true)
        expect(subject.decorate_method).to eq :decorate_collection
      end

      it "should be :decorate if decorator supports it" do
        allow(decorator).to receive(:decorate)
        expect(subject.decorate_method).to eq :decorate
      end

      it "should be :new if decorator does not support :decorate" do
        expect(subject.decorate_method).to eq :new
      end
    end
  end
end
