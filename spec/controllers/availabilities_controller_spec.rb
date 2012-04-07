require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe AvailabilitiesController do

  # This should return the minimal set of attributes required to create a valid
  # Availability. As you add validations to Availability, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all availabilities as @availabilities" do
      availability = Availability.create! valid_attributes
      get :index
      assigns(:availabilities).should eq([availability])
    end
  end

  describe "GET show" do
    it "assigns the requested availability as @availability" do
      availability = Availability.create! valid_attributes
      get :show, :id => availability.id
      assigns(:availability).should eq(availability)
    end
  end

  describe "GET new" do
    it "assigns a new availability as @availability" do
      get :new
      assigns(:availability).should be_a_new(Availability)
    end
  end

  describe "GET edit" do
    it "assigns the requested availability as @availability" do
      availability = Availability.create! valid_attributes
      get :edit, :id => availability.id
      assigns(:availability).should eq(availability)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Availability" do
        expect {
          post :create, :availability => valid_attributes
        }.to change(Availability, :count).by(1)
      end

      it "assigns a newly created availability as @availability" do
        post :create, :availability => valid_attributes
        assigns(:availability).should be_a(Availability)
        assigns(:availability).should be_persisted
      end

      it "redirects to the created availability" do
        post :create, :availability => valid_attributes
        response.should redirect_to(Availability.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved availability as @availability" do
        # Trigger the behavior that occurs when invalid params are submitted
        Availability.any_instance.stub(:save).and_return(false)
        post :create, :availability => {}
        assigns(:availability).should be_a_new(Availability)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Availability.any_instance.stub(:save).and_return(false)
        post :create, :availability => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested availability" do
        availability = Availability.create! valid_attributes
        # Assuming there are no other availabilities in the database, this
        # specifies that the Availability created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Availability.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => availability.id, :availability => {'these' => 'params'}
      end

      it "assigns the requested availability as @availability" do
        availability = Availability.create! valid_attributes
        put :update, :id => availability.id, :availability => valid_attributes
        assigns(:availability).should eq(availability)
      end

      it "redirects to the availability" do
        availability = Availability.create! valid_attributes
        put :update, :id => availability.id, :availability => valid_attributes
        response.should redirect_to(availability)
      end
    end

    describe "with invalid params" do
      it "assigns the availability as @availability" do
        availability = Availability.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Availability.any_instance.stub(:save).and_return(false)
        put :update, :id => availability.id, :availability => {}
        assigns(:availability).should eq(availability)
      end

      it "re-renders the 'edit' template" do
        availability = Availability.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Availability.any_instance.stub(:save).and_return(false)
        put :update, :id => availability.id, :availability => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested availability" do
      availability = Availability.create! valid_attributes
      expect {
        delete :destroy, :id => availability.id
      }.to change(Availability, :count).by(-1)
    end

    it "redirects to the availabilities list" do
      availability = Availability.create! valid_attributes
      delete :destroy, :id => availability.id
      response.should redirect_to(availabilities_url)
    end
  end

end
