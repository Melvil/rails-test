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

describe VacanciesController do

  # This should return the minimal set of attributes required to create a valid
  # Vacancy. As you add validations to Vacancy, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # VacanciesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all vacancies as @vacancies" do
      vacancy = Vacancy.create! valid_attributes
      get :index, {}, valid_session
      assigns(:vacancies).should eq([vacancy])
    end
  end

  describe "GET show" do
    it "assigns the requested vacancy as @vacancy" do
      vacancy = Vacancy.create! valid_attributes
      get :show, {:id => vacancy.to_param}, valid_session
      assigns(:vacancy).should eq(vacancy)
    end
  end

  describe "GET new" do
    it "assigns a new vacancy as @vacancy" do
      get :new, {}, valid_session
      assigns(:vacancy).should be_a_new(Vacancy)
    end
  end

  describe "GET edit" do
    it "assigns the requested vacancy as @vacancy" do
      vacancy = Vacancy.create! valid_attributes
      get :edit, {:id => vacancy.to_param}, valid_session
      assigns(:vacancy).should eq(vacancy)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Vacancy" do
        expect {
          post :create, {:vacancy => valid_attributes}, valid_session
        }.to change(Vacancy, :count).by(1)
      end

      it "assigns a newly created vacancy as @vacancy" do
        post :create, {:vacancy => valid_attributes}, valid_session
        assigns(:vacancy).should be_a(Vacancy)
        assigns(:vacancy).should be_persisted
      end

      it "redirects to the created vacancy" do
        post :create, {:vacancy => valid_attributes}, valid_session
        response.should redirect_to(Vacancy.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved vacancy as @vacancy" do
        # Trigger the behavior that occurs when invalid params are submitted
        Vacancy.any_instance.stub(:save).and_return(false)
        post :create, {:vacancy => {}}, valid_session
        assigns(:vacancy).should be_a_new(Vacancy)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Vacancy.any_instance.stub(:save).and_return(false)
        post :create, {:vacancy => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested vacancy" do
        vacancy = Vacancy.create! valid_attributes
        # Assuming there are no other vacancies in the database, this
        # specifies that the Vacancy created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Vacancy.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => vacancy.to_param, :vacancy => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested vacancy as @vacancy" do
        vacancy = Vacancy.create! valid_attributes
        put :update, {:id => vacancy.to_param, :vacancy => valid_attributes}, valid_session
        assigns(:vacancy).should eq(vacancy)
      end

      it "redirects to the vacancy" do
        vacancy = Vacancy.create! valid_attributes
        put :update, {:id => vacancy.to_param, :vacancy => valid_attributes}, valid_session
        response.should redirect_to(vacancy)
      end
    end

    describe "with invalid params" do
      it "assigns the vacancy as @vacancy" do
        vacancy = Vacancy.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Vacancy.any_instance.stub(:save).and_return(false)
        put :update, {:id => vacancy.to_param, :vacancy => {}}, valid_session
        assigns(:vacancy).should eq(vacancy)
      end

      it "re-renders the 'edit' template" do
        vacancy = Vacancy.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Vacancy.any_instance.stub(:save).and_return(false)
        put :update, {:id => vacancy.to_param, :vacancy => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested vacancy" do
      vacancy = Vacancy.create! valid_attributes
      expect {
        delete :destroy, {:id => vacancy.to_param}, valid_session
      }.to change(Vacancy, :count).by(-1)
    end

    it "redirects to the vacancies list" do
      vacancy = Vacancy.create! valid_attributes
      delete :destroy, {:id => vacancy.to_param}, valid_session
      response.should redirect_to(vacancies_url)
    end
  end

end
